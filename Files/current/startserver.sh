FastFreeMinecraftServer/Files/current/.env;
mkdir -p ~/.docker/cli-plugins;
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64 -o ~/.docker/cli-plugins/docker-compose;
chmod +x ~/.docker/cli-plugins/docker-compose;
sudo usermod -aG docker $USER;
newgrp docker;
docker compose -f FastFreeMinecraftServer/Files/current/docker-compose.yml up -d;
