package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	port := os.Getenv("port")
	path := os.Getenv("path")
	if path == "" {
		path = "siteContent"
	}
	log.Println("srart... on ", port, " /", path)

	fileServer := http.FileServer(http.Dir("./" + path))
	http.Handle("/", fileServer)
	http.ListenAndServe(":9000", nil)
}
