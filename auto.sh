#!/bin/bash

sudo apt update && sudo apt upgrade -y;

sudo apt autoremove;

sudo apt clean;

sudo apt install apache2 php -y;

sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y;

sudo echo "<Directory /var/www/html/>" | sudo tee -a /etc/apache2/apache.conf;
sudo echo "    AllowOverride All" | sudo tee -a /etc/apache2/apache.conf;
sudo echo "</Directory>" | sudo tee -a /etc/apache2/apache.conf;

sudo apt install curl;

sudo cd /tmp;
sudo curl -O https://wordpress.org/latest.tar.gz;

sudo tar xzvf latest.tar.gz;
sudo touch /tmp/wordpress/.htaccess;
sudo cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php;
sudo mkdir /tmp/wordpress/wp-content/upgrade;

sudo cp -a /tmp/wordpress/. /var/www/html;
sudo chown -R www-data:www-data /var/www/html;

sudo find /var/www/html/ -type d -exec chmod 750 {} \; ;
sudo find /var/www/html/ -type f -exec chmod 640 {} \; ;





