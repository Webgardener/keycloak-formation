package main

import (
	"log"
	"net/http"

	"kc-oauth2-oidc-lab/internal/httpapp"
)

func main() {
	log.Println("BFF listening on :3000")
	log.Fatal(http.ListenAndServe(":3000", httpapp.NewRouter()))
}

