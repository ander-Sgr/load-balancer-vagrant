#!/bin/bash

# Configurar nginx como proxy

# Eliminar la configuración predeterminada de nginx si es necesario
sudo rm -f /etc/nginx/sites-enabled/default

# Crear la nueva configuración para el proxy
sudo tee /etc/nginx/sites-available/proxy > /dev/null <<'EOF'
upstream backend {
    server 192.168.100.100:8080;
    server 192.168.100.101:8080;
    server 192.168.100.102:8080;
}

server {
    listen 8000;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
EOF

# Crear un enlace simbólico para activar la configuración del proxy
sudo ln -sf /etc/nginx/sites-available/proxy /etc/nginx/sites-enabled/proxy

# Reiniciar el servicio de nginx para aplicar los cambios
sudo service nginx restart
