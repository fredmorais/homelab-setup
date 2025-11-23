# Replace /etc/apk/repositories and update packages
cp alpine/apks.config /etc/apk/repositories &&
apk update

# Install default packages
apk add --no-cache \
	docker \
	nano \
	docker-cli-compose \
	gcompat \
	libstdc++ \
	curl \
	bash \
	git \
	util-linux \
  e2fsprogs-extra \
  qemu-guest-agent \
  sudo

# Enable gemu guest agent and docker
rc-update add qemu-guest-agent
rc-update add docker boot

apk add \
	py3-netifaces \
	cloud-init

# Replace /etc/ssh/sshd_config
cp sshd.config /etc/ssh/sshd_config

# Create group for allowing secure ssh
addgroup ssh-secure

# Start docker
service docker start

# Disable root account password
passwd -d root

# Setup cloud init
setup-cloud-init

# Delete folder
rm -r homelab-setup

# Shutdown
poweroff