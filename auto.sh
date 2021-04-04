#!/bin/bash

sudo apt update && sudo apt upgrade -y;

sudo apt autoremove;

sudo apt clean;

sudo apt install apache2 php unzip -y;


sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-mysql -y;

sudo service apache2 restart;
sudo cp /etc/apache2/apache2.conf apache2.conf.bak
sudo echo "<Directory /var/www/html/>" | sudo tee -a /etc/apache2/apache2.conf;
sudo echo "    AllowOverride All" | sudo tee -a /etc/apache2/apache2.conf;
sudo echo "</Directory>" | sudo tee -a /etc/apache2/apache2.conf;

sudo apt install curl;

cd /tmp;
sudo wget https://wordpress.org/latest.zip;

sudo unzip latest.zip;
sudo touch /tmp/wordpress/.htaccess;
sudo cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php;
sudo mkdir /tmp/wordpress/wp-content/upgrade;

sudo cp -a /tmp/wordpress/. /var/www/html;
sudo rm /var/www/html/index.html;
sudo chown -R www-data:www-data /var/www/html;

sudo find /var/www/html/ -type d -exec chmod 750 {} \; ;
sudo find /var/www/html/ -type f -exec chmod 640 {} \; ;

sudo fallocate -l 2G /swapfile;
sudo chmod 600 /swapfile;
sudo mkswap /swapfile;
sudo swapon /swapfile;
sudo echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab ;







