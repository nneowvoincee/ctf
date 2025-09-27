#!/bin/zsh
# setup script for kali linux

cd $HOME
sudo apt update
sudo apt-get update
sudo apt install -y pipx
# Pwn ---------------------------------------

#one gadget
sudo gem install one_gadget 

# pwndbg
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ../

# docker
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
sudo apt install -y docker-compose

# pwntools
sudo apt-get install -y python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
# python3 -m pip install --upgrade pip
# python3 -m pip install --upgrade pwntools
sudo apt install -y python3-pwntools

# patchelf & pwninit
sudo apt-get install -y patchelf
ver=$(curl -s https://api.github.com/repos/io12/pwninit/releases/latest | grep tag_name | cut -f4 -d "\"")
curl -LjO https://github.com/io12/pwninit/releases/download/"$ver"/pwninit
chmod 777 pwninit
sudo mv pwninit /usr/local/bin

PWN_TEMPLATE="./pwn_template.py"
if [ -f "$PWN_TEMPLATE" ]; then
mv ./pwn_template.py ~/.config
echo "alias pwninit='pwninit --template-path ~/.config/pwn_template.py --template-bin-name elf'" >> ~/.zshenv
else
echo "$PWN_TEMPLATE does not exist."
fi

# seccomp-tools (shellcode sandbox analysis)
sudo apt install -y gcc ruby-dev
sudo gem install seccomp-tools

# for do different architecture pwn /source: (https://twzx.gitee.io/wuyi000925.github.io/2021/04/12/%E5%BC%82%E6%9E%84pwn%E7%8E%AF%E5%A2%83%E6%90%AD%E5%BB%BA/)
sudo apt-get install -y qemu
sudo apt-get install -y qemu-user-static
sudo apt-get install -y qemu-system
sudo apt-get install -y bridge-utils
sudo apt-get install -y git gdb gdb-multiarch

sudo apt-get install -y binutils-aarch64-linux-gnu  # you may install any types of arch
#sudo apt-get install binutils-mips-linux-gnu
#sudo apt-get install binutils-powerpc-linux-gnu

#gadget
# sudo -H python3 -m pip install ROPgadget
pipx install ROPgadget

# Crypro --------------------------------------
# pycryptodome
# pip install pycryptodome
sudo apt install -y python3-pycryptodome


# z3
# pip install z3-solver
pipx install -y z3-solver


# Forensic/Misc -----------------------------------
sudo apt install -y hexedit

wget http://www.caesum.com/handbook/Stegsolve.jar -O stegsolve.jar
chmod +x stegsolve.jar
mkdir bin
mv stegsolve.jar bin/
# roboot to change the usermod state
#sudo reboot