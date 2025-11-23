# Homelab setup

- Install
- Remove local-lvm and expand local

## Proxmox

nano /var/lib/vz/snippets/config.yml
qm set 142 --cicustom "user=local:snippets/config.yml"

## Alpine

setup-alpine
reboot
apk add git
git clone https://github.com/fredmorais/homelab-setup
cd homelab-setup/alpine
sh setup.sh
cd .. && rm -r homelab-setup
