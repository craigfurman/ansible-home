sudo add-apt-repository ppa:ansible/ansible
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y ansible git
git clone https://github.com/craigfurman/ansible-home.git
cd ansible-home
./run.sh local
