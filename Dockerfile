FROM sglebs/bottlepython3

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8080
# to emulate Heroku - env var has port. 8080 for OpenShift defaults compatibility
ENV PORT 8080

CMD uwsgi --disable-logging --http-socket :$PORT --module wsgi  --gevent 512 --gevent-monkey-patch  --processes `expr 1 \+ 2 \* $(getconf _NPROCESSORS_ONLN)`  --listen 128
#CMD ulimit -n 1024; gunicorn --worker-class=gevent --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application
#CMD ulimit -n 1024; gunicorn --worker-class=meinheld.gmeinheld.MeinheldWorker --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application

