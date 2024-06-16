# Fast and Free Minecraft Server

The concept of this project is to automate most of the server building and configurating so that with just a couple of clicks and some more minutes, a 24/7 Minecraft server is live and running.

## Planning

Methods that I have thought of:

- Shell script to do everything
- Python script to do everything
- Docker container
- Merge of human interaction and automation os some parts
- Etc.

## Researching

### ["Original" (the first oracle cloud minecraft server that I heard of) Blog post](https://blogs.oracle.com/developers/post/how-to-set-up-and-run-a-really-powerful-free-minecraft-server-in-the-cloud)

1. [Sign Up for an Always Free Account](https://signup.cloud.oracle.com/)
   1. Account info
      1. Country
      2. First Name
      3. Last Name
      4. Email
      5. Button: Captcha
      6. Button: Verify Email
   2. Password
      1. Set a password
      2. Confirm Password
      3. Company Name (optional)
      4. Cloud Account Name
      5. Select Home Region (Closes to you)
   3. Address Information
      1. Address Line 1
      2. Address Line 2 (optional)
      3. City
      4. State
      5. Zip/Postal Code
      6. Button: continue
   4. Mobile verification
      1. Phone Number
      2. Button: Text me a code
      3. Verification Code
      4. Button: Verify my code
   5. Payment verification
      1. Button: Add payment verification method
   6. Agreement
      1. Checkbos: Start my free trial
      2. Button: Start my free trial
   7. Email reception that confirms the account creation
2. Create a Virtual Machine Instance
   1. Oracle Cloud > Get Started > Quick Actions > Create a VM instance

[Finish later...](https://blogs.oracle.com/developers/post/how-to-set-up-and-run-a-really-powerful-free-minecraft-server-in-the-cloud#:~:text=Give%20your%20VM%20instance%20a%20name)

#### What could be automated?

- Auto insert some previouly defined info
  - Country
  - First Name
  - Last Name
  - Email
  - Password
  - Cloud Account Name
  - Home Region
    - [ ] Find a way to find the closest region to the user
    - [ ] Select a random region
    - [ ] Let the user choose the region from a list
  - Adress Line 1
  - City
  - State
  - Zip/Postal Code
  - Phone Number
- [ ] Auto verify email
- [ ] Auto verify phone number

Should I use Google Forms? 🤔

### Youtube

- [TechnoTim](https://youtu.be/_ypAmCcIlBE) - [Notes](https://technotim.live/posts/pterodactyl-game-server/)
  - [Pterodactyl Panel](https://pterodactyl.io/)
    - [Panel](https://github.com/pterodactyl/panel)
    - [Eggs](https://github.com/parkervcp/eggs)
      - [CurseForge](https://github.com/parkervcp/eggs/tree/master/game_eggs/minecraft/java/curseforge)
  - [Docker](https://www.docker.com/)

### GitHub

1. [mchum](https://github.com/mchum/oracle-minecraft/tree/main)
   - Ansible
   - Terraform
2. [martiandeath](https://github.com/martiandeath/Minecraft-Server-Setup)
   - Kinda has a tutorial of what to do
   - Gets forge and vanilla servers
     - Gets forge from something [like this](https://mvnrepository.com/artifact/net.minecraftforge/forge/1.19.2-43.1.52)
   - Seems pretty straightforward
   - His codes:
     - [Update Forge-Minecraft-Server-Setup.sh](https://github.com/martiandeath/Minecraft-Server-Setup/blob/main/Forge-Minecraft-Server-Setup.sh)
     - [Vanilla-Minecraft-Server-Setup.sh](https://github.com/martiandeath/Minecraft-Server-Setup/blob/main/Vanilla-Minecraft-Server-Setup.sh)
3. [LuizDoubleG](https://github.com/LuizDoubleG/Minecraft-RL-Server-Oracle)
   - Has many [useful scripts](https://github.com/LuizDoubleG/Minecraft-RL-Server-Oracle/tree/server/sh_scripts)
   - No Configuring at all
4. [mgrimace](https://github.com/mgrimace/Minecraft-on-Oracle)
   - Creates a Minecraft Bedrock server
   - [CraftyControl](https://craftycontrol.com/) to manage the server
5. [TheRemote](https://github.com/TheRemote/MinecraftBedrockServer)
   - Creates a Minecraft Bedrock server
6. [TheRemote](https://github.com/TheRemote/Legendary-Bedrock-Container)
   - Creates a Minecraft Bedrock server within a Docker container
7. [brucethemoose](https://github.com/brucethemoose/Free-Oracle-Minecraft-Server-Tutorial)
   - Connects via SSH Using VSCode
   - Teaches how to download java
   - Installs Minecraft Server to auto restart
   - How to run server without the GUI (nohup)
   - Focuses on speed

## Processes to be automated

- [ ] Create Oracle Cloud account
- [ ] Create a VM
- [ ] Configure DNS
- [ ] Configure Firewall
- [ ] Install Minecraft Server
- [ ] Configure Minecraft Server
- [ ] Start Minecraft Server
- [ ] Install Forge
- [ ] Install Mods
- [ ] Start Minecraft Server with Mods
- Optionals
  - [ ] Configure Backups
  - [ ] Configure Monitoring

## History

What I want to do is to facilitate the process of creating a Minecraft server. I want to make it as easy as possible, so that anyone can do it.

Some ways that I created my own Minecraft server before:

1. Simple local server for LAN
2. Local Server + [Hamachi](https://vpn.net/)
3. Local Server + [Radmin](https://www.radmin-vpn.com/)
4. [Local Host](https://www.minecraft.net/en-us/download/server) + [Hamachi](https://vpn.net/)/[Radmin](https://www.radmin-vpn.com/)
5. [Aternos](https://aternos.org/)
6. [Oracle Cloud](https://www.oracle.com/cloud/)

When I first created a free Minecraft server, I had to wait for a long time at [Aternos](https://aternos.org/)' queue. They had anti-afk policies and other stuff that bothered me.
...

## Interesting Links

- [OCI Starter](https://www.ocistarter.com/)
- [OCI CLI](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cliconcepts.htm)
