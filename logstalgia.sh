#!/bin/bash
tail ./logs/nginx/accessproxy.log | logstalgia --sync
