podman build --target game-client -t game-client --format docker .
podman build --target matchmaking-server -t matchmaking-server --format docker .
# podman build --target client -t client --format docker .