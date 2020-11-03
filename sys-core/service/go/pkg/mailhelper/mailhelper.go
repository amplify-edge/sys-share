package mailhelper

import "github.com/matcornic/hermes/v2"

func ConstructEmail(product hermes.Product, body hermes.Body) ([]byte, error) {
	mailTheme := hermes.Hermes{
		Product: product,
	}
	em := hermes.Email{
		Body: body,
	}
	htmlString, err := mailTheme.GenerateHTML(em)
	if err != nil {
		return nil, err
	}
	return []byte(htmlString), nil
}
