## Docker Ether-1 Service Node © cryon.io 2019

Docker template for Ether1 Service nodes.

*Created and maintained with support from [Ether-1 Project](https://ether1.org/), Ether-1 Community and VPS provider - [WebAge](https://clients.webage.online/order/main/packages/Kernel-based%20Virtual%20Machine/?group_id=6).*

ETHO Donations: `0x46Ff451710Dd245040098c2F308CA55A373ff2cE`

[Quickstart Guide](https://github.com/cryi/docker-etho-sn/wiki/Quick-Start-with-AMS)

## Prerequisites 

1. 64-bit installation
2. 3.10 or higher version of the Linux kernel (latest is recommended)

(If you run on VPS provider, which uses OpenVZ, setup requires at OpenVZ 7)

## Setup AMS (AUTONOMOUS MASTERNODE SYSTEM - recommended)

1. - `git clone "https://github.com/cryi/AMS.git" [path] && cd [path] && chmod +x ./ams` # replace path with directory you want to store node in
   or 
   - `wget https://github.com/cryi/AMS/archive/master.zip && unzip -o master.zip && mv ./AMS-master [path] && cd [path] && chmod +x ./ams`
2. one of commands below depending of your preference (run as *root* or use *sudo*)
    - `./ams --full --node=ETHO_SN` # full setup of Ether1 SN/MN for current user
    - `./ams --full --user=[user] --node=ETHO_SN --auto-update-level=[level]` # full setup of Ether1 SN/MN for defined user (directory location and structure is preserved) sets specified auto update level (Refer to Autoupdates)
3.  logout, login and check node status
    - `./ams --node-info` #     
4. register your ETHO node https://nodes.ether1.org/login.php
    - Instructions: [Ether-1 SN/MN Setup Section 8](https://docs.ether1.org/masternodes/installing-uninstalling-ether-1-nodes/setting-up-ether-1-mn-sn#section-8-node-dashboard-verification-process-an-explanation-on-how-to-finalize-the-node-set-up-the-process-on-the-ether-1-website)

## Manual Setup (non AMS)

Recommended only for advance users. Guide - [Manual Setup](https://github.com/cryi/docker-etho-sn/wiki/Manual-Setup).
