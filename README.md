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
![Architecture](https://raw.githubusercontent.com/edhull/BootcampDevops/master/architecture.jpeg)
### Requirements:
Docker 1.10+ & Docker-Compose (2)


### Installation & Running
Feel free to change the scaling on the application servers to however many instances you like by modifying ``appy=2`` below:
```sh
$ git clone https://github.com/edhull/BootcampDevops
$ cd BootcampDevops
$ docker-compose -d up && docker-compose scale appy=2 nginx-proxy=1
$ for i in {1..5}; do curl localhost && echo; done #To demonstrate it works!
```
### Fun stuff!
As the nginx log files are exposed locally to the host, we can visualise what's happening natively. 

By piping the logfiles through [Logstalgia](http://logstalgia.io/) (and using custom formatted nginx logs) we can see the distribution of traffic across the containers. Traffic can be simulated using JMeter or any other traffic load simulator and will produce a visualisation similar to the below:

 
![Logstalgia](https://raw.githubusercontent.com/edhull/BootcampDevops/master/logstalgia.jpeg)


### Monitoring
A monitoring solution based on [Dockprom](https://github.com/stefanprodan/dockprom) was experimented with to monitor the state of containers and a host system. The system monitors the resource usage by individual containers using Nodeexporter and cAdvisor, the host resource usage with Prometheus and produces a graphical representation of data with Grafana. The monitoring section is currently work in progress.

[![yay2.png](https://s16.postimg.org/q9ai605kl/yay2.png)](https://postimg.org/image/lnedxnk1d/)


