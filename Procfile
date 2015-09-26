web: newrelic-admin run-program gunicorn -k gevent --threads $WORKER_CONCURRENCY --preload --worker-connections 750 --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO restserver:application
# to define how many gunicorn workers: heroku config:set WEB_CONCURRENCY=5
#to define number of threads in each worker: heroku config:set WORKER_CONCURRENCY=10