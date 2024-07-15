#!/bin/bash

# Instalar ufw si no está instalado
sudo apt-get update
sudo apt-get install -y ufw

# Resetear las reglas por defecto
sudo ufw --force reset

# Permitir SSH solo desde proxy_serv y 192.168.1.133 (tu host real)
sudo ufw allow from 192.168.100.10 to any port 22
sudo ufw allow from 192.168.1.133 to any port 22

# Permitir acceso al puerto 8080 (ejemplo, ajusta según tus necesidades)
sudo ufw allow 8080

# Denegar SSH desde cualquier otra dirección
sudo ufw deny 22


# Habilitar ufw
sudo ufw --force enable

# Verificar el estado de ufw
sudo ufw status verbose
