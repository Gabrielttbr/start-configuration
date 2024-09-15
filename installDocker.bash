#!/bin/sh

set -o errexit
set -o nounset
IFS=$(printf '\n\t')

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
printf '\nDocker installed successfully\n\n'

# Adiciona o usuário atual ao grupo docker
sudo usermod -aG docker "$(whoami)"
printf 'User added to the Docker group. Please log out and log back in for the group changes to take effect.\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

# Docker Compose
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f 4)
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
printf '\nDocker Compose installed successfully\n\n'

# Verifica as versões
docker --version
docker-compose --version

#!/bin/sh

set -o errexit
set -o nounset
IFS=$(printf '\n\t')

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
printf '\nDocker installed successfully\n\n'

# Adiciona o usuário atual ao grupo docker
sudo usermod -aG docker "$(whoami)"
printf 'User added to the Docker group. Please log out and log back in for the group changes to take effect.\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

# Docker Compose
COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d '"' -f 4)
sudo curl -L https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
printf '\nDocker Compose installed successfully\n\n'

# Verifica as versões
docker --version
docker-compose --version

