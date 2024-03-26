#!/usr/bin/python3
"""
Script that takes in a integer as a parameter and
displays information about an employee's TODO list progress
"""
import requests
from sys import argv

if __name__ == "__main__":
    user_id = argv[1]
    user_url = 'https://jsonplaceholder.typicode.com/users/{}'.format(user_id)
    todo_url = 'https://jsonplaceholder.typicode.com/todos?userId={}'.format(user_id)

    user_response = requests.get(user_url)
    todo_response = requests.get(todo_url)

    if user_response.status_code == 200 and todo_response.status_code == 200:
        user_data = user_response.json()
        todo_data = todo_response.json()

        name = user_data.get('name')
        tasks = [task.get('title') for task in todo_data]
        done_tasks = [task.get('title') for task in todo_data if task.get('completed')]

        total_tasks = len(tasks)
        total_done_tasks = len(done_tasks)

        print("Employee {} is done with tasks({}/{}):".format(name, total_done_tasks, total_tasks))
        for task in done_tasks:
            print("\t {}".format(task))
