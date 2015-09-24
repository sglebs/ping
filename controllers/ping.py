import datetime
from bottle import route


@route('/ping')
def ping():
    return {"time": datetime.datetime.utcnow().isoformat()}
