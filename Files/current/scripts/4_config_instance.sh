
echo "# Configurando a instância Ubuntu para o servidor Minecraft..."

echo "## Atualizando o sistema..."

sudo apt update;

echo "## Instalando Docker, git e Docker Compose..."

sudo apt install -y docker.io git;

echo "## Clonando o repositório..."

git clone https://github.com/jvfd3/FastFreeMinecraftServer.git;

echo "## Adicionando Chave da API do CurseForge..."

echo 'CF_API_KEY=$$2a$10$$XYdetNISecgcwijJiUl2MOtEACI0s2oVo4bzV/j7xUEgzm8Gg9yce' > FastFreeMinecraftServer/Files/current/.env;

echo "## Configurando Docker Compose..."

mkdir -p ~/.docker/cli-plugins &&
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64 -o ~/.docker/cli-plugins/docker-compose &&
chmod +x ~/.docker/cli-plugins/docker-compose;
sudo usermod -aG docker $USER &&
newgrp docker;

echo "## Iniciando o servidor Minecraft com Docker Compose..."

docker compose -f FastFreeMinecraftServer/Files/current/docker-compose.yml up -d;