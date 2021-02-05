package certutils

import (
	"crypto/tls"
	"crypto/x509"
	"encoding/pem"
	"fmt"
	"io/ioutil"

	"github.com/caddyserver/certmagic"
	"google.golang.org/grpc/credentials"
)

func getCACert(domain string) (*x509.Certificate, error) {
	conf := &tls.Config{
		InsecureSkipVerify: true,
	}
	conn, err := tls.Dial("tcp", fmt.Sprintf("%s:443", domain), conf)
	if err != nil {
		return nil, err
	}
	defer conn.Close()
	certs := conn.ConnectionState().PeerCertificates
	for _, cert := range certs {
		if cert.IsCA {
			return cert, nil
		}
	}
	return nil, fmt.Errorf("unable to get CA from server: cert does not exist")
}

// DownloadCACert downloads public CA certificate from a domain and put it in outputPath.
func DownloadCACert(outputPath, domain string) error {
	cert, err := getCACert(domain)
	if err != nil {
		return err
	}
	publicKeyBlock := pem.Block{
		Type:  "CERTIFICATE",
		Bytes: cert.Raw,
	}
	publicKeyPem := pem.EncodeToMemory(&publicKeyBlock)
	return ioutil.WriteFile(outputPath, publicKeyPem, 0644)
}

// LoadTLSKeypair loads certificate and certificate key
// returns TransportCredetials and error.
func LoadTLSKeypair(certPath, keyPath string) (credentials.TransportCredentials, error) {
	serverCert, err := tls.LoadX509KeyPair(certPath, keyPath)
	if err != nil {
		return nil, err
	}

	config := &tls.Config{
		Certificates: []tls.Certificate{serverCert},
		ClientAuth:   tls.NoClientCert,
	}

	return credentials.NewTLS(config), nil
}

func ClientLoadCA(cacertPath string) (credentials.TransportCredentials, error) {
	pemServerCA, err := ioutil.ReadFile(cacertPath)
	if err != nil {
		return nil, err
	}
	certPool := x509.NewCertPool()
	if !certPool.AppendCertsFromPEM(pemServerCA) {
		return nil, fmt.Errorf("failed to add server CA's certificate")
	}
	config := &tls.Config{
		RootCAs: certPool,
	}
	return credentials.NewTLS(config), nil
}

func GenerateTLSConfig(staging bool, email string, domains ...string) (*tls.Config, error) {
	cache := certmagic.NewCache(certmagic.CacheOptions{
		GetConfigForCert: func(certmagic.Certificate) (*certmagic.Config, error) {
			return &certmagic.Default, nil
		},
	})
	acmeMgr := certmagic.ACMEManager{
		Agreed: true,
		Email:  email,
	}
	cfg := certmagic.Default
	if staging {
		acmeMgr.CA = certmagic.LetsEncryptStagingCA
	} else {
		acmeMgr.CA = certmagic.LetsEncryptProductionCA
	}
	myAcme := certmagic.NewACMEManager(&cfg, acmeMgr)
	magic := certmagic.New(cache, cfg)
	magic.Issuer = myAcme
	err := magic.ManageSync(domains)
	if err != nil {
		return nil, err
	}
	return magic.TLSConfig(), nil
}
