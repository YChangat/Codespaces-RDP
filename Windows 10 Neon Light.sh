#!/bin/bash
sudo apt update
sudo apt install -y docker.io docker-compose
mkdir -p dockercom
wget -O dockercom/install.bat "https://raw.githubusercontent.com/YChangat/Codespaces-RDP/refs/heads/main/install.bat"
cat <<EOF > dockercom/Windows_10_Neon_Light.yaml
services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: 'https://crustywindo.ws/collection/Windows%2011/Windows%2011%20X-Lite%20%2822621.1555%29%20_Neon%20Nights%20Pro_.iso'
      USERNAME: 'Jor3a-Ti9niya'
      PASSWORD: 'admin@123'
      RAM_SIZE: '12G'
      CPU_CORES: '4'
      DISK_SIZE: '990G'
      DISK2_SIZE: '101G'
    volumes:
      -  /workspaces/codespaces-blank/dockercom/:/oem  
    devices:
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - "8006:8006"
      - "3389:3389/tcp"
      - "3389:3389/udp"
    stop_grace_period: 2m
EOF

cd dockercom
sudo docker-compose -f Windows_10_Neon_Light.yaml up
