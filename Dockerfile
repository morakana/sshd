from ubuntu:20.04
arg SSHD_LISTEN_ADDRESS
arg SSHD_LISTEN_PORT
run export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -y wget curl git xauth neovim iproute2 openssh-server && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/' /etc/ssh/sshd_config && \
  sed -i 's/#X11DisplayOffset 10/X11DisplayOffset 10/' /etc/ssh/sshd_config && \
  sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config && \
  echo 'ALL: ALL' >> /etc/hosts.deny && \
  echo "sshd: $SSHD_LISTEN_ADDRESS" >> /etc/hosts.allow && \
  echo "root:root" | chpasswd && \
  service ssh restart && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
entrypoint ["/usr/sbin/sshd"]
cmd ["-D"]

