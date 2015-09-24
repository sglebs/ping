from bottle import default_app, app, run
import os

DEBUG_PORT = "8085"
port = os.environ.get("PORT", DEBUG_PORT)

application = default_app()
import controllers.ping # necessary so that Bottle will install its routes
run(application, host='0.0.0.0', port=port)