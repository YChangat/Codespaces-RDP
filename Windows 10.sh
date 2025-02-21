#!/bin/bash
sudo apt update
sudo apt install -y docker.io docker-compose
mkdir -p dockercom
echo "services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: "10"
      USERNAME: "Jor3a-Ti9niya"
      PASSWORD: "admin@123"
      RAM_SIZE: "12G"
      CPU_CORES: "4"
      DISK_SIZE: "990G"
      DISK2_SIZE: "101G"
    devices:         
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    stop_grace_period: 2m" > windows10.yaml


cd dockercom

sudo docker-compose -f windows10.yaml up
