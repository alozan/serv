# Update packages list and update system
sudo apt-get update
sudo apt upgrade -y

#Clone Repository
git clone https://github.com/alozan/serv.git
cd serv
sudo ./install.sh