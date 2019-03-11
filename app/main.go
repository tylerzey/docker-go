package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func main() {
	r := mux.NewRouter()

	r.HandleFunc("/", indexFunc).Methods("GET")
	r.HandleFunc("/test", testFunc).Methods("GET")
	// run server
	log.Fatal(http.ListenAndServe(":80", r))
}

func indexFunc(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	res := map[string]int{
		"success": 2,
	}
	json.NewEncoder(w).Encode(res)
}

func testFunc(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	res := map[string]bool{
		"testing": false,
	}
	json.NewEncoder(w).Encode(res)
}
