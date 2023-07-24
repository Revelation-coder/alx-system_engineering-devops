#!/usr/bin/python3
import requests
import sys

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: {} <employee_id>".format(sys.argv[0]))
        sys.exit(1)

    employee_id = sys.argv[1]
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = "{}/users/{}".format(base_url, employee_id)
    todo_url = "{}/todos?userId={}".format(base_url, employee_id)

    try:
        user_response = requests.get(user_url)
        user_response.raise_for_status()
        user_data = user_response.json()
        employee_name = user_data.get("name")

        todo_response = requests.get(todo_url)
        todo_response.raise_for_status()
        todo_data = todo_response.json()
        total_tasks = len(todo_data)
        done_tasks = sum(1 for task in todo_data if task.get("completed"))

        print("Employee {} is done with tasks({}/{}):".format(employee_name, done_tasks, total_tasks))
        for task in todo_data:
            if task.get("completed"):
                print("\t{}".format(task.get("title")))
    except requests.exceptions.RequestException as e:
        print("Error:", e)
        sys.exit(1)
