#!/bin/bash
tail -f logs/nginx/accessproxy.log | ./logstalgia/logstalgia 
