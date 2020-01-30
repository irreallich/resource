#!bin/bash  
echo ""
echo "hjwang ubuntu18 environment install started ......"

echo "start basic install..."
font="${HOME}/.fonts"

work="${HOME}/work"
config="${work}/config"
worktest="${work}/test"
share="${work}/share"

src="${work}/src"
opensource="${src}/opensource"
projects="${src}/projects"

download="${work}/download"

ftproot="${share}/ftproot"
tftproot="${share}/tftproot"
nfsroot="${share}/nfsroot"

learn="${download}/learn"
doc="${download}/doc"
tools="${download}/tools"
toolssrc="${tools}/src"

packages="${download}/packages"
resource="${download}/resource"

mkdir -p ${font}
mkdir -p ${config}
mkdir -p ${opensource}
mkdir -p ${projects}
mkdir -p ${learn}
mkdir -p ${doc}
mkdir -p ${packages}
mkdir -p ${resource}
mkdir -p ${toolssrc}
mkdir -p ${ftproot}
mkdir -p ${tftproot}
mkdir -p ${nfsroot}

export PATH=~/.local/bin/:$PATH

# install tools 
# change source for apt
cd /etc/apt/
sudo wget https://raw.githubusercontent.com/irreallich/res/master/settings/sources.list_ali
sudo mv sources.list sources.list_original
sudo cp sources.list_ali sources.list
sudo apt update -y
sudo apt upgrade -y

# install npm cnpm and change npm source
sudo apt install npm -y
npm config set registry https://registry.npm.taobao.org
npm config get registry
npm install -g cnpm --registry=https://registry.npm.taobao.org

cd
sudo apt install tree git unrar net-tools wget preload tig silversearcher-ag -y
sudo apt install gcc make pkg-config cmake autoconf automake libtool -y
sudo apt install libyaml-dev libxml2-dev libncurses5-dev -y
sudo apt install clang-format htop glances shellcheck clang -y 
sudo apt install manpages-posix manpages-posix-dev manpages-dev manpages-zh -y


# for python
sudo apt install python3 python3-dev python3-doc  -y
sudo apt install python3-docutils libseccomp-dev libjansson-dev -y
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 100
sudo apt install python3-pip ipython3 python3-ipdb -y
pip3 install --upgrade --user pip

if [ ! -f "${HOME}/.pip/pip.conf" ]; then
    mkdir ${HOME}/.pip
    echo "[global]" >> ${HOME}/.pip/pip.conf
    echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> ${HOME}/.pip/pip.conf
    echo "trusted-host = pypi.tuna.tsinghua.edu.cn" >> ${HOME}/.pip/pip.conf
fi
pip3 install -U --user setuptools pygments testresources pylint autopep8 vim-vint pynvim

# for language server 
pip3 install -U --user fortran-language-server
pip3 install -U --user python-language-server
# ref: https://github.com/mads-hartmann/bash-language-server
sudo npm i -g bash-language-server

# for ssh server
sudo apt install openssh-server -y 
sudo service ssh start
# time zone 
sudo timedatectl set-local-rtc true
sudo timedatectl set-ntp true

# ripgrep
cd ${packages}
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb

# universal-ctags
cd ${toolssrc}
git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh
./configure 
make
sudo make install

# bear
cd ${toolssrc}
git clone https://github.com/rizsotto/Bear.git
cd Bear
mkdir build
cd build
cmake ../
make
sudo make install

# vim
cd ${toolssrc}
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-cscope --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ --enable-rubyinterp=yes --enable-terminal --enable-gui=auto 
make
sudo make install

# for youcomplete ,reference: https://clang.llvm.org/extra/clangd/Installation.html
# sudo apt install clang-tools
# sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-8 100

#for coc.nvim support: 如果需要编译安装的话需要安装下面的内容
#安装node.js
cd ${packages}
wget install-node.now.sh/lts
chmod +x lts
sudo ./lts
#安装yarn,用来编译coc
wget  https://yarnpkg.com/install.sh
chmod +x install.sh
sudo ./install.sh
rm -rf ./lts ./install.sh


cd ${config}
git clone git@github.com:irreallich/vimrc.d.git --recursive
git clone git@github.com:irreallich/resource.git
git clone git@github.com:irreallich/bashrc.d.git

# just run once
#echo "export WORK=\"${HOME}/work\""  >> ${HOME}/.bashrc
#echo "source $HOME/work/config/bashrc.d/bashrc"  >> ${HOME}/.bashrc


#------------------------------------------------------------------------------------------
# for desktop
# install
sudo apt-get install ibus-pinyin -y

#install gnome desktop
echo "install gnome shell and tweak tool"
sudo apt-get install gnome-session -y
sudo apt-get install gnome-tweak-tool -y
sudo apt-get install gnome-shell-extensions -y

# install gnome arc theme
echo "install gnome arc theme"
sudo add-apt-repository ppa:noobslab/themes -y
sudo apt-get update -y
sudo apt-get install arc-theme -y

# install gnome flat remix icon
echo "install gnome flat remix icon"
sudo add-apt-repository ppa:noobslab/icons -y
sudo apt-get update -y
sudo apt-get install flat-remix-icons -y

#install vscode
cd ${packages}
wget https://vscode.cdn.azure.cn/stable/86405ea23e3937316009fc27c9361deee66ffbf5/code_1.40.0-1573064499_amd64.deb
sudo dpkg -i code_1.40.0-1573064499_amd64.deb
#wps
wget https://wdl0.cache.wps.cn/wps/download/ep/Linux2019/8865/wps-office_11.1.0.8865_amd64.deb
sudo dpkg -i wps-office_10.1.0.8865_amd64.deb
git clone https://github.com/GitHubNull/wps_fonts.git && cd wps_fonts && chmod +x install.sh && ./install.sh

sudo apt install hardinfo dia filezilla -y
# for music
sudo apt install audacious -y
sudo apt install audacious-plugins audacious-plugins-data -y
# for video
sudo apt install smplayer vlc -y 
# for themes
sudo apt install gnome-shell-extension-autohidetopbar -y
sudo apt install gnome-shell-extension-dashtodock -y
# 输入法
sudo apt install ibus-rime librime-data-pinyin-simp  -y
# mail
sudo apt install evolution -y
# update drivers
sudo ubuntu-drivers autoinstall
# auto remove 

# for network setting
sudo apt install uml-utilities bridge-utils ifupdown -y


sudo apt autoremove
