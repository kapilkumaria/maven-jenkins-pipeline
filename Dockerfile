  FROM jenkins/jenkins

  USER root

  # Update repositories and install python
  RUN apt-get update && apt-get -y install python && apt-get -y install python3-pip

  # Installing Ansible
  RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
           python get-pip.py && \
           pip3 install ansible --upgrade

  RUN apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
  RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
  RUN apt update
  RUN apt -y install docker-ce docker-ce-cli containerd.io


  # Installing Docker-Compose
  RUN curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose

  # Add "jenkins user" to the docker group so that this user can execute docker commands
  RUN usermod -aG docker jenkins

  USER jenkins