FROM frolvlad/alpine-python2

WORKDIR /app
COPY . /app

RUN apk --update add --virtual build-dependencies python-dev build-base \
    && pip install -r requirements.txt \
    && apk del build-dependencies

EXPOSE 8080
# to emulate Heroku - env var has port. 8080 for OpenShift defaults compatibility
ENV PORT 8080

CMD gunicorn -k gevent --preload --timeout 31 --keep-alive 1 --backlog 2048 --log-syslog --log-syslog-prefix GUNICORN --log-level INFO -c gunicorn_config.py wsgi:application