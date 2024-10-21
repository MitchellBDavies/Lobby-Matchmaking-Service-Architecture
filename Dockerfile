FROM python:3.9-slim as matchmaking-server
WORKDIR /usr/matchmaking-server/src/fastapi
COPY ./matchmaking-server/src /usr/matchmaking-server/src/fastapi/matchmaking-server/src
COPY ./matchmaking-server/Pipfile /usr/matchmaking-server/src/fastapi/
COPY ./utils/server_health_check.py /usr/utils/
RUN python -m pip install pipenv requests
RUN pipenv install
EXPOSE 80
HEALTHCHECK --interval=5s --timeout=5s --start-period=5s \
   CMD python /usr/utils/server_health_check.py
CMD pipenv run fastapi run matchmaking-server/src/main.py --proxy-headers --host 0.0.0.0 --port 80

FROM python:3.9-slim as game-client
WORKDIR /usr/game-client/
COPY ./game-client/src /usr/game-client/src/
COPY ./game-client/Pipfile /usr/game-client/
RUN python -m pip install pipenv \
   && pipenv install
CMD pipenv run python src/main.py