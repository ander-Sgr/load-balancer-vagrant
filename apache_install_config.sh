#!/bin/bash

# update dependencies & install apache2
sudo apt-get update
sudo apt-get install -y apache2

# Cambia el puerto en /etc/apache2/ports.conf
if ! grep -q "Listen 8080" /etc/apache2/ports.conf; then
    sudo sed -i 's/^Listen 80$/Listen 8080/' /etc/apache2/ports.conf
fi

# Cambia el puerto en /etc/apache2/sites-available/000-default.conf
if ! grep -q "<VirtualHost \*:8080>" /etc/apache2/sites-available/000-default.conf; then
    sudo sed -i 's/^<VirtualHost \*:80>$/<VirtualHost *:8080>/' /etc/apache2/sites-available/000-default.conf
fi

# Verifica la sintaxis de la configuración de Apache
sudo apache2ctl configtest

# Reinicia Apache solo si la prueba de configuración es exitosa
if [ $? -eq 0 ]; then
    sudo systemctl restart apache2
else
    echo "Error de configuración de Apache. No se reinició Apache."
fi
