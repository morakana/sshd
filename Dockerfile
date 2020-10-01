from ubuntu:20.04
arg SSHD_LISTEN_ADDRESS
run export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -y openssh-server && \
  sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  echo 'ALL: ALL' >> /etc/hosts.deny && \
  echo "sshd: $SSHD_LISTEN_ADDRESS" >> /etc/hosts.allow && \
  echo "root:root" | chpasswd && \
  service ssh restart && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
entrypoint ["/usr/sbin/sshd"]
cmd ["-D"]

