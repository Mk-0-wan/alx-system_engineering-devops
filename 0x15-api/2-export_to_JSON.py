#!/usr/bin/python3
"""
Script that takes in a integer as a parameter and
displays information about an employee's TODO list progress
"""

from json import dump
from requests import get
from sys import argv

if __name__ == "__main__":
    USER_ID = argv[1]
    user_url = f'https://jsonplaceholder.typicode.com/users/{USER_ID}'
    todo_url = f'https://jsonplaceholder.typicode.com/todos?userId={USER_ID}'

    user_response = get(user_url)
    todo_response = get(todo_url)

    if (user_response.status_code == 200 and
            todo_response.status_code == 200):
        user_data = user_response.json()
        todo_data = todo_response.json()

        new_dict = {}
        another_list = []

        with open(f"{USER_ID}.json", "w+", encoding="utf-8") as fp:
            for data in todo_data:
                another_dict = {}
                another_dict['task'] = data['title']
                another_dict['completed'] = data['completed']
                another_dict['username'] = user_data.get('username')
                another_list.append(another_dict)
                new_dict[USER_ID] = another_list
            dump(new_dict, fp)
