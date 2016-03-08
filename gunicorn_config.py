
from multiprocessing import cpu_count
import os

def max_workers():
    default =  2 * cpu_count() + 1
    return int(os.environ.get("WEB_CONCURRENCY", default))

def max_threads():
    default = 10 * cpu_count()
    return int(os.environ.get("WORKER_CONCURRENCY", default))

def max_worker_connections():
    default = 1024
    return int(os.environ.get("WORKER_CONNECTIONS", default))

worker_class = 'gevent'
workers = max_workers() # max number of workers / python VMs
threads = max_threads() # max number of green gevent threads per gunicorn worker
worker_connections = max_worker_connections() # the maximum number of simultaneous clients that a single process can handle
