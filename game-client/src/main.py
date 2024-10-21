import os
import requests
import time

matchmaking_server = os.getenv("matchmaking_server")

while True:
    try:
        r = requests.get(matchmaking_server)
        response = {
            "status_code": r.status_code,
            "body": r.text
        }
        print(response)
    except:
        print(f"FAILED TO REACH {matchmaking_server}")
    time.sleep(.5)