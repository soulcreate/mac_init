sudo apt install net-tools #ifconfig

#dns over proxy
#https://github.com/Victoralm/Install-dnscrypt-proxy-on-Ubuntu-18.04
#https://cryptoworld.su/zashhita-privatnosti-s-pomoshhyu-dnscrypt/
sudo add-apt-repository ppa:shevchuk/dnscrypt-proxy
sudo apt update
sudo apt install dnscrypt-proxy
nano /etc/dnscrypt-proxy/dnscrypt-proxy.toml
#nano /etc/resolv.conf
sudo systemctl daemon-reload
sudo systemctl stop dnscrypt-proxy.socket
sudo systemctl enable dnscrypt-proxy
sudo systemctl start dnscrypt-proxy
dig ya.ru #check what dns use
