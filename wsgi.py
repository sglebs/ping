from bottle import default_app

application = default_app()
import controllers.ping # necessary so that Bottle will install its routes
