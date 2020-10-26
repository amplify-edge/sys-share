package shared

import (
	"fmt"
)

type ErrorReason int

const (
	ErrInvalidParameters = iota
	ErrInvalidCredentials
	ErrMissingToken
	ErrInvalidToken
	ErrDecryptionToken
	ErrInsufficientRights
	ErrRegistrationError
	ErrCreatingToken
	ErrAccountNotFound
	ErrQueryAccount
	ErrVerifyPassword
	ErrRequestUnauthenticated
	ErrVerificationTokenMismatch
	ErrAccountDisabled
)

// AuthError containing error reason and golang's err
type Error struct {
	Reason ErrorReason
	Err    error
}

func (err Error) Error() string {
	if err.Err != nil {
		return fmt.Sprintf("%s (%v)", err.description(), err.Err)
	}
	return err.description()
}

func (err Error) description() string {
	switch err.Reason {
	case ErrInvalidParameters:
		return "Invalid credentials parameters"

	case ErrInvalidCredentials:
		return "Invalid credentials"

	case ErrMissingToken:
		return "Missing token"

	case ErrInvalidToken:
		return "Invalid token"

	case ErrDecryptionToken:
		return "Error during token decryption"

	case ErrInsufficientRights:
		return "Insufficient rights"

	case ErrRegistrationError:
		return "Error during registration, unable to create user"

	case ErrCreatingToken:
		return "Error while creating token"

	case ErrAccountNotFound:
		return "Error account not found"

	case ErrQueryAccount:
		return "Error querying account"

	case ErrVerifyPassword:
		return "Error verifying password"

	case ErrRequestUnauthenticated:
		return "Error: request unauthenticated"

	case ErrVerificationTokenMismatch:
		return "Error: verification token mismatch"

	case ErrAccountDisabled:
		return "Error: account is disabled"
	}

	return "Unknown error"
}
