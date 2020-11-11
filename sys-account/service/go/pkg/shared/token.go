package shared

import (
	"context"
	"strings"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/grpc-ecosystem/go-grpc-middleware/util/metautils"

	"github.com/getcouragenow/sys-share/sys-account/service/go/pkg"
	"github.com/getcouragenow/sys-share/sys-core/service/config"
)

var (
	DefaultAccessExpiration  = 10 * time.Minute    // 10 minutes access token
	DefaultRefreshExpiration = 14 * 24 * time.Hour // two weeks
)

// PermChecker interface allows or disallows current claimant to access / perform
// the task he/she wants.
type PermChecker interface {
	IsAllowed(t *TokenClaims) (bool, error)
}

type ContextKey string

func (c ContextKey) String() string {
	return "sys_account.repo.grpc context key " + string(c)
}

const (
	ContextKeyClaims = ContextKey("auth-claims")
	HeaderAuthorize  = "authorization"
)

type TokenConfig struct {
	AccessSecret      []byte
	RefreshSecret     []byte
	AccessExpiration  time.Duration
	RefreshExpiration time.Duration
}

func NewTokenConfig(accessSecret, refreshSecret []byte) *TokenConfig {
	return &TokenConfig{
		AccessSecret:      accessSecret,
		RefreshSecret:     refreshSecret,
		AccessExpiration:  DefaultAccessExpiration,
		RefreshExpiration: DefaultRefreshExpiration,
	}
}

// Claimants are ones who are able to get token claims
type Claimant interface {
	GetId() string
	GetEmail() string
	GetRole() []*pkg.UserRoles
}

// TokenClaims is the representation of JWT auth claims
type TokenClaims struct {
	UserId    string           `json:"userId"`
	Role      []*pkg.UserRoles `json:"role"`
	UserEmail string           `json:"userEmail"`
	jwt.StandardClaims
}

// TokenPairDetails contain both AccessToken and RefreshToken of the user
// This in turn will be saved to the Genji / Badger DB as `session data`
type TokenPairDetails struct {
	AccessToken  string
	RefreshToken string
	ATExpiry     int64  // unix epoch or nano (TODO @WinWisely268: specify be it in millis or in nanos, for now use milli)
	RTExpiry     int64  // same as above
	ATId         string // access token id, for storing to the database alongside refresh token id below
	RTId         string // this way we can update and delete token (somewhat) easily.
}

// NewTokenPairs returns new TokenPairDetails for given Claimant
func (tc *TokenConfig) NewTokenPairs(claimant Claimant) (*TokenPairDetails, error) {
	var tpd TokenPairDetails
	cl := NewTokenClaims(tc.AccessExpiration, claimant)
	accessToken, err := tc.newAccessToken(cl)
	if err != nil {
		return nil, err
	}
	tpd.AccessToken = accessToken
	rcl := NewTokenClaims(tc.RefreshExpiration, claimant)
	refreshToken, err := jwt.NewWithClaims(jwt.SigningMethodHS512, rcl).SignedString(tc.RefreshSecret)
	if err != nil {
		return nil, err
	}
	tpd.RefreshToken = refreshToken
	tpd.ATExpiry = config.CurrentTimestamp() + tc.AccessExpiration.Nanoseconds()
	tpd.RTExpiry = config.CurrentTimestamp() + tc.RefreshExpiration.Nanoseconds()
	tpd.ATId = config.NewID()
	tpd.RTId = config.NewID()

	return &tpd, nil
}

// create token claims for refresh / access token
func NewTokenClaims(exp time.Duration, c Claimant) *TokenClaims {
	role := c.GetRole()
	claims := TokenClaims{
		UserId:    c.GetId(),
		Role:      role,
		UserEmail: c.GetEmail(),
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(exp).UnixNano(),
		},
	}
	return &claims
}

// ParseTokenStringToClaim parses given token (access or refresh) and returns token claims with embedded JWT claims
// if token is indeed valid
func (tc *TokenConfig) ParseTokenStringToClaim(authenticate string, isAccess bool) (TokenClaims, error) {
	var claims TokenClaims
	token, err := jwt.ParseWithClaims(authenticate, &claims, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, Error{Reason: ErrDecryptionToken}
		}
		if isAccess {
			return tc.AccessSecret, nil
		} else {
			return tc.RefreshSecret, nil
		}
	})
	if err != nil {
		return TokenClaims{}, Error{Reason: ErrDecryptionToken, Err: err}
	}

	if !token.Valid {
		return TokenClaims{}, Error{Reason: ErrInvalidToken}
	}
	return claims, nil
}

// RenewAccessToken given a refresh token
func (tc *TokenConfig) RenewAccessToken(tcl *TokenClaims) (string, error) {
	// TODO @gutterbacon: RenewAccessToken should remove / invalidates the currently supplied access token first
	return tc.newAccessToken(tcl)
}

func (tc *TokenConfig) newAccessToken(tcl *TokenClaims) (string, error) {
	return jwt.NewWithClaims(
		jwt.SigningMethodHS512,
		tcl,
	).SignedString(tc.AccessSecret)
}

// ObtainClaimsFromContext obtains token claims from given context with value.
func ObtainClaimsFromContext(ctx context.Context) TokenClaims {
	claims, ok := ctx.Value(ContextKeyClaims).(TokenClaims)
	if !ok {
		return TokenClaims{}
	}
	return claims
}

func FromMetadata(ctx context.Context) (authMeta string, err error) {
	authMeta = metautils.ExtractIncoming(ctx).Get(HeaderAuthorize)
	if authMeta == "" {
		return "", Error{Reason: ErrMissingToken}
	}
	splitted := strings.Split(authMeta, " ")
	if len(splitted) != 2 {
		return "", Error{Reason: ErrMissingToken}
	}
	bearer := strings.ToLower(splitted[0])
	if bearer != "bearer" {
		return "", Error{Reason: ErrMissingToken}
	}
	return splitted[1], nil
}
