package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "text/plain")
		w.Write([]byte("Healthy!"))
	})

	fmt.Println("Server is running at http://localhost:8080")
	http.ListenAndServe(":8080", nil)
}
