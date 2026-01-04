# Sequência

- To-Do:
  - Adicionar Initialization Script na criação da instância

## Ligar Servidor Local

- **CurseForge**
  - Instalar Curseforge
    - Adição do Craftoria ao CurseForge
  - **API Key**
    - Aquisição de API Key do CurseForge
      - Adicionar API Key ao .env
      - Trocar os três `$` por `$$` no .env
- **Docker**
  - Instalação do Docker Desktop no Windows
  - [Atualizar](https://setupmc.com/java-server/) `docker-compose.yml` com nova versão do modpack
  - Ligando docker compose
    1. `cd .\20251227\`
    2. `docker compose up`

## Ligando Servidor Oracle

### Criando Instância

#### Resumo das Configurações

1. Basic Information
   - Name: Minecraft
   - Image and Shape
     - Image:
       - Operating system: Canonical Ubuntu 20.04
     - Shape: Ampere
       - Instance Type: Virtual machine **(default)**
       - Shape series: Ampere: Arm-based processor.
       - Shape Name: VM.Standard.A1.Flex (Always Free-eligible) | OCPU: 2 (80 max) | Memory (GB): 24 (512 max)
   - Advanced: Management: Initialization Script: Paste cloud-init script
     - Cloud-init script:

       ```bash
        sudo dnf install -y git;
        git clone https://github.com/jvfd3/FastFreeMinecraftServer.git;
        cd FastFreeMinecraftServer/Files/current/;
       ```

2. Security
3. Networking
   - Primary VNIC
     - VNIC name: VNIC-20251229-minecraft
     - Primary Network:
       - [x] Create new virtual cloud network
         - New virtual cloud network name: VCN-20251229-minecraft
       - [x] Create new public subnet **(default)**
       - New subnet name: subnet-20251229-minecraft
   - **Download SSH keys**

---

- Após provisionado:
  - Instances>Networking>subnet>security>Default Security List>Security Rules>Add Ingress Rules:
    - Ingress Rule 1
      - IP Protocol: TCP
      - Destination Port Range: 25565
      - Source CIDR: 0.0.0.0/0
    - Ingress Rule 2
      - IP Protocol: UDP
      - Source CIDR: 0.0.0.0/0
      - Destination Port Range: 25565

- **Copie o IP Público da instância para acessar via SSH**

#### Completo

##### 1. Basic Information

- Name: **Minecraft**
- Create in compartment: candonga (root) **(Default)**
- **Placement**
  - Availability Domain: AD 1; GUva: SA-SAOPAULO-1-AD-1 **(default)**
  - Advanced options:
    - Capacity type:
      - [x] On-demand capacity: Place the instance on a shared host using on-demand capacity. **(default)**
      - [ ] Preemptible capacity: Place the instance on a shared host using preemptible capacity. This instance can be reclaimed at any time.
      - [ ] Capacity reservation: Place the instance on a shared host, and have it count against a capacity reservation.
      - [ ] Dedicated host: Place the instance on a dedicated virtual machine host.
      - [ ] Compute cluster: Place the instance on a remote direct memory access (RDMA) network, called a compute cluster.
    - Cluster Placement Group: False **(default)**
    - Fault Domain: none **(default)**
- Image and Shape
  - Image:
    - Operating system: Canonical Ubuntu 20.04
    - Image build: 2025.07.23-0 **(default)**
    - Security: Shielded instance **(default)**
  - Shape: Ampere
    - Instance Type:
      - [x] Virtual machine: A virtual machine is an independent computing environment that runs on top of physical bare metal hardware. **(default)**
      - [ ] Bare metal: A bare metal compute instance gives you dedicated physical server access for highest performance and strong isolation.
    - Shape series:
      - [ ] AMD: Flexible OCPU count. Current generation AMD processors. **(default)**
      - [ ] Intel: Flexible OCPU count. Current generation Intel processors.
      - [x] Ampere: Arm-based processor.
      - [ ] Specialty and previous generation: Always Free, Dense I/O, GPU, HPC, Generic, and earlier generation AMD and Intel standard shapes.
    - Shape Name:
      - [x] VM.Standard.A1.Flex (Always Free-eligible) | OCPU: 1 (80 max) | Memory (GB): 6 (512 max)
      - [ ] VM.Standard.A2.Flex | OCPU: 1 (78 max) | Memory (GB): 6 (946 max)
    - Network bandwidth (Gbps): 1 Gbps **(default)**
    - Maximum VNICs: 2 **(default)**
    - Number of OCPUs: 2
    - Amount of memory (GB): 24
- Shape Build:
  - Virtual machine
  - 2 core OCPU
  - 24 GB memory
  - 2 Gbps network bandwidth
- Advanced options:
  - Management
    - Instance Metadata service:
      - [ ] Require an authorization header **(default)**
    - Initialization Script:
      - [x] Choose cloud-init script file **(default)**
      - [ ] Paste cloud-init script
      - Cloud-init script
  - Tagging
    - Tags: None **(default)**
- Availability configuration
  - Live Migration:
    - [x] Let Oracle Cloud Infrastructure choose the best migration option: If an underlying infrastructure component needs to undergo maintenance, let Oracle Cloud Infrastructure choose the best option to migrate the instance to a healthy physical VM host. **(default)**
    - [ ] Use live migration if possible: The instance is live migrated to a healthy physical VM host without any notification or disruption. Use Events to track the progress. If live migration isn't successful, reboot migration is used. Some shapes don't support live migration.
    - [ ] Send maintenance notification: A notification is sent for the maintenance event, and the instance is only live migrated if you do not proactively reboot the instance before the due date.
  - [x] Restore instance lifecycle state after infrastructure maintenance **(default)**
  - Oracle Cloud Agent
    - [ ] WebLogic Management Service **(default)**
    - [ ] Vulnerability Scanning **(default)**
    - [ ] Oracle Java Management Service **(default)**
    - [ ] OS Management Hub Agent **(default)**
    - [ ] Management Agent **(default)**
    - [ ] Fleet Application Management Service **(default)**
    - [x] Custom Logs Monitoring **(default)**
    - [ ] Compute RDMA GPU Monitoring **(default)**
    - [x] Compute Instance Run Command **(default)**
    - [x] Compute Instance Monitoring **(default)**
    - [ ] Compute HPC RDMA Auto-Configuration **(default)**
    - [ ] Compute HPC RDMA Authentication **(default)**
    - [x] Cloud Guard Workload Protection **(default)**
    - [ ] Block Volume Management **(default)**
    - [ ] Bastion **(default)**

##### 2. Security

- Security:
  - [ ] Shielded instance **(default)**
  - Advanced options:
    - Security Attributes:
      - Tags: None **(default)**

---

- Secure Boot: Disabled **(default)**
- Measured Boot: Disabled **(default)**
- Trusted Platform Module: Disabled **(default)**

##### 3. Networking

- Primary VNIC
  - VNIC name: VNIC-20251229-minecraft
  - Primary Network:
    - [ ] Select existing virtual cloud network **(default)**
    - [x] Create new virtual cloud network
      - New virtual cloud network name: VCN-20251229-minecraft
      - Create in compartment: candonga (root) **(default)**
    - [ ] Specify OCID
  - subnet:
    - [x] Create new public subnet **(default)**
    - New subnet name: subnet-20251229-minecraft
    - Create in compartment: candonga (root) **(default)**
    - CIDR block: 10.0.0.0/24 **(default)**
- Private IPv4 address assignment
  - Subnet IPv4 prefixes: 10.0.0.0/24 **(default)**
    - [x] Private IPv4 address: Automatically assign private IPv4 address **(default)**
    - [ ] Manually assign private IPv4 address
- Public IPv4 address assignment
  - [x] Automatically assign a public IPv4 address **(default)**
- IPv6 address assignment
  - [ ] Assign IPv6 address from subnet prefix **(default)**
- Advanced options

  - DNS record
    - [x] Assign a private DNS record **(default)**
    - [ ] Do not assign a private DNS record
    - hostname: None **(default)**
  - Fully qualified domain name: <hostname>.subnet12280212.vcn12280212.oraclevcn.com
  - Launch options:
    - [x] Let Oracle Cloud Infrastructure choose the best networking... **(default)**
    - [ ] Paravirtualized networking
    - [ ] Hardware-assisted (SR-IOV) networking
  - VCN Tags: None **(default)**
  - Subnet Tags: None **(default)**

- Add SSH keys
  - [x] Generate a key pair for me (LEMBRE-SE DE SALVAR A PRIVATE KEY!) **(default)**
  - [ ] Upload public keys
  - [ ] Paste public keys
  - [ ] No SSH keys

##### 4. Storage

- Boot volume
  - [ ] Specify a custom boot volume size and performance setting **(default)**
  - [x] Use in-transit encryption **(default)**
  - [ ] Encrypt this volume with a key that you manage **(default)**
- Block volumes: None **(default)**

##### Save as a Stack: candonga

- Name: Minecraft
- Compartment: ocid1.tenancy.oc1..aaaaaaaa3vzjiz7354idew4yjfbcjqah3bywaz2p2hrhvchdfpcfaw5qkmjq
- Terraform Version: 1.5.x

##### Configurando Ingress Rules

- Instances>Networking>subnet>security>Default Security List>Security Rules>Add Ingress Rules
  - Ingress Rule 1
    - [ ] Stateless **(default)**
    - Source Type: CIDR **(default)**
    - Source CIDR: 0.0.0.0/0
    - IP Protocol: TCP **(default)**
    - Source Port Range: None **(default)**
    - Destination Port Range: 25565
    - Description: None **(default)**
  - **Another Ingress Rule**
  - Ingress Rule 2
    - [ ] Stateless **(default)**
    - Source Type: CIDR **(default)**
    - Source CIDR: 0.0.0.0/0
    - IP Protocol: UDP **(default)**
    - Source Port Range: None **(default)**
    - Destination Port Range: 25565
    - Description: None **(default)**
  - **Add Ingress Rules**

## Acessando via SSH

- Mova as chaves para a pasta .\20251227\
- Mova a chave para um local seguro:
  - `$originalPath="B:\Pastas do sistema\Downloads\ssh-key-2026-01-03.key"; $newPath="$Env:USERPROFILE\.ssh\MyOracleKey"; Move-Item $originalPath $newPath -Force` <!-- JV -->
  - **ou**
  - `$originalPath="$Env:USERPROFILE\Downloads\ssh-key-2026-01-03.key"; $newPath="$Env:USERPROFILE\.ssh\MyOracleKey"; Copy-Item $originalPath $newPath -Force`
- Altere as permissões da chave privada:
  - `icacls $newPath /inheritance:r /grant:r "$($Env:USERNAME):R"`
- Comando para acessar a instância via SSH:
  - `$publicIP="146.235.55.234"`
  - `ssh -i "caminho/para/sua/private_key.pem" opc@IP_DA_SUA_INSTANCIA`
  - `ssh -i .\20251227\ssh-key-2025-12-29.key opc@$publicIP`
  - `ssh -i $Env:USERPROFILE\.ssh\MyOracleKey opc@$publicIP`
  - Para Oracle Linux: `ssh -i $newPath opc@$publicIP`
  - Para Ubuntu: `ssh -i $newPath ubuntu@$publicIP`
- **Máquina acessada**

## Ligando o Servidor Minecraft na Instância

- Dentro do Ubuntu
  - `sudo apt update; sudo apt install -y docker.io git; git clone https://github.com/jvfd3/FastFreeMinecraftServer.git; echo 'CF_API_KEY=$$2a$10$$XYdetNISecgcwijJiUl2MOtEACI0s2oVo4bzV/j7xUEgzm8Gg9yce' > FastFreeMinecraftServer/Files/current/.env; mkdir -p ~/.docker/cli-plugins && curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64 -o ~/.docker/cli-plugins/docker-compose && chmod +x ~/.docker/cli-plugins/docker-compose; sudo usermod -aG docker $USER && newgrp docker; docker compose -f FastFreeMinecraftServer/Files/current/docker-compose.yml up -d;`
  - `sudo apt update; sudo apt install -y docker.io git; git clone https://github.com/jvfd3/FastFreeMinecraftServer.git; echo 'CF_API_KEY=$$2a$10$$XYdetNISecgcwijJiUl2MOtEACI0s2oVo4bzV/j7xUEgzm8Gg9yce' > FastFreeMinecraftServer/Files/current/.env; mkdir -p ~/.docker/cli-plugins && curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64 -o ~/.docker/cli-plugins/docker-compose && chmod +x ~/.docker/cli-plugins/docker-compose; sudo usermod -aG docker $USER && newgrp docker; docker compose -f FastFreeMinecraftServer/Files/current/docker-compose.yml up -d;`

---

cloud-init script completo:

```bash
apt install -y git docker.io curl;
git clone https://github.com/jvfd3/FastFreeMinecraftServer.git;
$DOCKER_COMPOSE_URL="https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-aarch64";
mkdir -p ~/.docker/cli-plugins &&
curl -SL $DOCKER_COMPOSE_URL -o ~/.docker/cli-plugins/docker-compose &&
chmod +x ~/.docker/cli-plugins/docker-compose;
sudo usermod -aG docker $USER &&
# newgrp docker;
FastFreeMinecraftServer/Files/current/scripts/cloud_init.sh --CF_API_KEY="$$2a$10$$<API_KEY_HERE>";
```

inside_init

```bash
$ENV_PATH="FastFreeMinecraftServer/Files/current/.env";
echo $CF_API_KEY > $ENV_PATH;
docker compose -f FastFreeMinecraftServer/Files/current/docker-compose.yml up -d;
```
