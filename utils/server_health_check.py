import requests

r = requests.get("http://localhost:80/health")
response = {
    "status_code": r.status_code,
    "body": r.text
}
print(response)
