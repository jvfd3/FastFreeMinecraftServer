#cloud-config
package_update: true
packages:
  - git
  - docker.io
  - curl

runcmd:
  - git clone https://github.com/jvfd3/FastFreeMinecraftServer.git /opt/FastFreeMinecraftServer
  - chmod +x /opt/FastFreeMinecraftServer/inside_init
  - CF_API_KEY="$$2a$10$$<API_KEY_HERE>" /opt/FastFreeMinecraftServer/inside_init