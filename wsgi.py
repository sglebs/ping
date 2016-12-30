from bottle import default_app, run

application = default_app()
import controllers.ping # necessary so that Bottle will install its routes

if __name__ == '__main__':
    run(application, host='0.0.0.0', port=9090)