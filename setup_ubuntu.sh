#Enable the other repos that are disabled by default
echo "Enabling Partner Repos"
sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse

#Download and Install GetDeb and PlayDeb
echo "Downloading GetDeb and PlayDeb" &&
wget http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb http://archive.getdeb.net/install_deb/playdeb_0.3-1~getdeb1_all.deb &&

echo "Installing GetDeb" &&
sudo dpkg -i getdeb-repository_0.1-1~getdeb1_all.deb &&

echo "Installing PlayDeb" &&
sudo dpkg -i playdeb_0.3-1~getdeb1_all.deb &&

echo "Deleting Downloads" &&
rm -f getdeb-repository_0.1-1~getdeb1_all.deb &&
rm -f playdeb_0.3-1~getdeb1_all.deb
#add repo for sublime-text-3
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
#add repo for vlc player
sudo add-apt-repository -y ppa:videolan/stable-daily
#add gimp repo
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
#add gnome repo
sudo add-apt-repository -y ppa:gnome3-team/gnome3
#add java repo
sudo add-apt-repository -y ppa:webupd8team/java
#add ppa manager repo
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
#add torrent client repo
sudo add-apt-repository -y ppa:transmissionbt/ppa
#add libDVDCSS repo
echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -

#update apt-get from new repos
sudo apt-get update
#upgrade packages
sudo apt-get -y upgrade
#update distro
sudo apt-get -y dist-upgrade

#install various essential programs

sudo apt-get -y install synaptic vlc gimp gimp-data gimp-plugin-registry gimp-data-extras y-ppa-manager bleachbit openjdk-7-jre oracle-java8-installer flashplugin-installer unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller libxine1-ffmpeg mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libswscale-extra-2 ubuntu-restricted-extras ubuntu-wallpapers* sublime-text-installer

#install google-chrome

if [[ $(getconf LONG_BIT) = "64" ]]
then
	echo "64bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
	sudo dpkg -i google-chrome-stable_current_amd64.deb &&
	rm -f google-chrome-stable_current_amd64.deb
else
	echo "32bit Detected" &&
	echo "Installing Google Chrome" &&
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb &&
	sudo dpkg -i google-chrome-stable_current_i386.deb &&
	rm -f google-chrome-stable_current_i386.deb
fi

#clean up everything

echo "Cleaning Up" &&
sudo apt-get -f install &&
sudo apt-get autoremove &&
sudo apt-get -y autoclean &&
sudo apt-get -y clean
