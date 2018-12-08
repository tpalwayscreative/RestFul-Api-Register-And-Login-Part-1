#Set up Slime on Apache
   <Directory "/var/www/your_domain_name/">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
  cp -r ./codeguy-Slim-3a2ac72/Slim /usr/local/Slim
  a2enmod rewrite
  service apache2 restart
 
    
