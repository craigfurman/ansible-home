set -euo pipefail

sudo apt-get update
sudo apt-get install -y python-pip libssl-dev
pip install --user --upgrade pip

(
mkdir -p ~/projects
cd ~/projects
git clone https://github.com/craigfurman/ansible-home.git
cd ansible-home
./run.sh local
)
