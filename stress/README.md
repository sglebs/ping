# Stress testing ping

This directory provides the setup needed to run  [locust](http://locust.io).

 * Create a Python 2.7 virtualenv for locust and activate it: virvtualenv ./env ; source ./env/bin/activate
 * Install the required modules from requitrements.txt in this dir: pip install -r requirements.txt
 * Launch locust against a running ping server: locust -f ./locustfile.py --host=http://ping.dokku.me:8080

