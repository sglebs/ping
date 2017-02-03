FROM sglebs/bottlepython3

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8080
# to emulate Heroku - env var has port. 8080 for OpenShift defaults compatibility
ENV PORT 8080

# Provide a default so that this image can be run with docker run locally if needed
ENV PROCFILE_TARGET web

# Run the image as a non-root user. Needed for Heroku.
RUN adduser -D myuser
USER myuser


# Make sure we honor the cmd-line in the Procfile
CMD exec `grep $PROCFILE_TARGET Procfile | sed 's/'$PROCFILE_TARGET':/ /'`
#CMD uwsgi --disable-logging --http-socket :$PORT --module wsgi  --gevent 512 --gevent-monkey-patch  --processes `expr 1 \+ 2 \* $(getconf _NPROCESSORS_ONLN)`  --listen 128
#CMD ulimit -n 1024; gunicorn --worker-class=gevent --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application
#CMD ulimit -n 1024; gunicorn --worker-class=meinheld.gmeinheld.MeinheldWorker --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application

