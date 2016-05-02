set -e

sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

mkdir -p ~/git-apps
pushd ~/git-apps
git clone --recursive https://github.com/ansible/ansible.git
popd

. ~/git-apps/ansible/hacking/env-setup

git clone https://github.com/craigfurman/ansible-home.git
(cd ansible-home && ./run.sh local)
