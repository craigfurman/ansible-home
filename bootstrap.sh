set -e

sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git libffi-dev libssl-dev python-pip
pip install paramiko PyYAML Jinja2 httplib2 six pycrypto

mkdir -p ~/git-apps
pushd ~/git-apps
git clone --recursive https://github.com/ansible/ansible.git
popd

. ~/git-apps/ansible/hacking/env-setup

git clone https://github.com/craigfurman/ansible-home.git
(cd ansible-home && ./run.sh local)
