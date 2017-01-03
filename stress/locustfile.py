from locust import HttpLocust
from locust import TaskSet
from locust import task


class MessengerTasks(TaskSet):
    def __init__(self, parent):
        TaskSet.__init__(self, parent)

    def on_start(self):
        self.client.verify = False # to eat self-signed SSL certificates

    @task(3)
    def ping(self):
        self.client.get("/ping", timeout=100)

class MessengerStressor(HttpLocust):
    min_wait = 1000
    max_wait = 5000
    task_set = MessengerTasks
