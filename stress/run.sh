#!/usr/bin/env bash
#
# web UI:
#locust -f ./locustfile.py --host=http://localhost:8080
#
# bump the number of hanfdles we can open
ulimit -n 4096
locust -f ./locustfile.py --host=http://localhost:8080 --clients=500 --hatch-rate=20 --num-request=5000 --no-web --only-summary  > locust.log   2>&1
