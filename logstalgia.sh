#!/bin/bash
tail -f logs/nginx/accessproxy.log | ./logstalgia/logstalgia -p 0.40 -x  
