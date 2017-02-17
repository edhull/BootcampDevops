#!/bin/bash
docker-compose up -d cadvisor
docker-compose up -d nodeexporter
docker-compose up -d alertmanager
docker-compose up -d grafana
docker-compose up -d prometheus
docker-compose scale appy=3 nginx-proxy=1
