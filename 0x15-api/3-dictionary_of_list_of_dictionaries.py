#!/usr/bin/python3
"""
Script that takes in a integer as a parameter and
displays information about an employee's TODO list progress
"""
from json import dump
from requests import get

if __name__ == "__main__":
    no_of_users = f'https://jsonplaceholder.typicode.com/users'
    users_response = get(no_of_users)
    users = users_response.json()

    with open("todo_all_employees.json", "w+", encoding="utf-8") as fp:
        all_todo_items = {}

        for user in users:
            user_id = user['id']
            todo_url = f'https://jsonplaceholder.typicode.com/ \
                    todos?userId={user_id}'
            todo_response = get(todo_url)

            if todo_response.status_code == 200:
                todo_data = todo_response.json()
                todo_list = []

                for todo in todo_data:
                    todo_dict = {
                        'task': todo['title'],
                        'completed': todo['completed'],
                        'username': user['username']
                    }
                    todo_list.append(todo_dict)

                all_todo_items[user_id] = todo_list

        dump(all_todo_items, fp)
