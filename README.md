# Devops Bootcamp - Capgemini Feb 2017 Exercise
> Ed Hull and Magdalena Sadowska

The purpose of this exercise is to demonstrate the ability to quickly spin up programmable infrastructure. The solution provides an nginx load balancer (based on the work of [jwilder's Nginx Proxy docker image](https://github.com/jwilder/nginx-proxy) with a custom docker-gen config) which can dynamically distribute traffic across multiple application servers. Containers running the application are discovered via the docker socket and registered within the nginx config, before sending the `restart` signal. 

The application servers run a basic Go program which returns their container id:
```sh
package main
import (
    "fmt"
    "net/http"
    "os"
)
 
func handler(w http.ResponseWriter, r *http.Request) {
    h, _ := os.Hostname()
    fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}
 
func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8484", nil)
}
```

### Requirements:
Docker 1.10+ & Docker-Compose (2)


### Installation & Running
Feel free to change the scaling on the application servers to however many instances you like by modifying ``appy=2`` below:
```sh
$ git clone https://github.com/edhull/BootcampDevops
$ cd BootcampDevops
$ docker-compose scale appy=2 nginx-proxy=1
$ for i in {1..5}; do curl localhost && echo; done #To demonstrate it works!
```

