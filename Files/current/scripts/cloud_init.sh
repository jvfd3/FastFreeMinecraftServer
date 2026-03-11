#cloud-config
package_update: true
packages:
  - git
  - docker.io
  - curl

runcmd:
  - apt update
  - apt install -y git docker.io curl
  - git clone https://github.com/jvfd3/FastFreeMinecraftServer.git /opt/FastFreeMinecraftServer
  - chmod +x /opt/FastFreeMinecraftServer/inside_init
  - mkdir -p /root/.docker/cli-plugins
  - curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64 -o /root/.docker/cli-plugins/docker-compose
  - chmod +x /root/.docker/cli-plugins/docker-compose
