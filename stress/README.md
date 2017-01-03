# Stress testing ping

This directory provides the setup needed to run  [locust](http://locust.io).

 * Create a Python 2.7 virtualenv for locust and activate it: virvtualenv ./env ; source ./env/bin/activate
 * Install the required modules from requitrements.txt in this dir: pip install -r requirements.txt
 * Bump the number of open handles in the shell: ulimit -n 4096
 * Launch locust against a running ping server: locust -f ./locustfile.py --host=http://ping.dokku.me:8080
 

