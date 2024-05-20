mkdir /tmp/upwork
cd /tmp/upwork
wget https://upwork-usw2-desktopapp.upwork.com/binaries/v5_8_0_33_42e992f623e44665/upwork-5.8.0.33-1fc24.x86_64.rpm
yay -S rpmextract

rpmextract.sh upwork*.rpm
sudo cp -r opt/Upwork /opt/
sudo cp -r usr/share/ /usr/share/
