#!/usr/bin/env bash

DIR="/usr/sbin/docker-compose"
if [[ ! -e $DIR ]]; then
  echo "Installing Docker..."
  sudo yum install -y docker
  sudo chkconfig docker on
  sudo service docker start
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  sudo ln -s /usr/local/bin/docker-compose /usr/sbin/docker-compose
fi

# Resolve the project root from this script's own location, instead of a
# hardcoded path, so this works no matter what folder the repo is cloned into.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Database migration
echo "Migrating Database..."

# Uncompress Dist (only if a pre-built dist.tar.gz is present; this project
# normally builds from source instead, via npm run rebuild at container start)
if [[ -f "$PROJECT_ROOT/www/api/dist.tar.gz" ]]; then
  cd "$PROJECT_ROOT/www/api/" && tar -xzvf dist.tar.gz
else
  echo "No dist.tar.gz found, skipping (building from source instead)."
fi

# Build Docker images
echo "Building Docker Images..."
cd "$PROJECT_ROOT"
./docker/production-build.sh

# Run containers for the first time
./docker/production-up.sh
