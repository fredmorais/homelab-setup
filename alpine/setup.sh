# Enable community repository and update packages
apk add nano && nano /etc/apk/repositories && apk update

# Install default packages
apk add --no-cache \
	docker \
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

# Change /etc/ssh/sshd_config
sed -i '/^PermitRootLogin/c\PermitRootLogin no' /etc/ssh/sshd_config
sed -i '/^AllowGroups/c\AllowGroups ssh-secure' /etc/ssh/sshd_config
sed -i '/^PubkeyAuthentication/c\PubkeyAuthentication yes' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication/c\PasswordAuthentication no' /etc/ssh/sshd_config
sed -i '/^PermitEmptyPasswords/c\PermitEmptyPasswords no' /etc/ssh/sshd_config
sed -i '/^AllowTcpForwarding/c\AllowTcpForwarding yes' /etc/ssh/sshd_config

# Create group for allowing secure ssh
addgroup ssh-secure

# Start docker
service docker start

# Reboot
reboot