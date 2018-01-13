package config

import (
	"encoding/json"
	"io/ioutil"
	"log"
	"os"
)

// Variables used for command line parameters
var Config configStruct

type configStruct struct {
	Token        string   `json:"Token"`
	RoomIDList   []string `json:"RoomIDList"`
	RoleToNotify string   `json:"RoleToNotify"`
	Servers      []server `json:"Servers"`
	GameStatus   string   `json:"GameStatus"`
}

type server struct {
	Name    string `json:"Name"`
	Address string `json:"Address"`
	Port    int    `json:"Port"`
	Online  bool   `json:"Online,omitempty"`
}

func Configure() {

	log.Println("Reading config file...")

	file, e := ioutil.ReadFile("./config.json")

	if e != nil {
		log.Printf("File error: %v\n", e)
		os.Exit(1)
	}

	log.Printf("%s\n", string(file))

	err := json.Unmarshal(file, &Config)

	if err != nil {
		log.Println(err)
	}

}
