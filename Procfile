web: newrelic-admin run-program gunicorn -k gevent --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application
# to define how many gunicorn workers: heroku config:set WEB_CONCURRENCY=5
#to define number of threads in each worker: heroku config:set WORKER_CONCURRENCY=10
#to define number of connections for all workers: heroku config:set WORKER_CONNECTIONS=750
