podman network create game_net

podman run --rm -d --net game_net --name matchmaking-server -p 80:80 matchmaking-server

until podman healthcheck run matchmaking-server
do 
    sleep 1
done

podman run --rm -d --net game_net --name game-client-1 -e matchmaking_server=http://matchmaking-server:80/ game-client