---

# Sprint 03 Lab01 - Vagrant

## Creación de un Bastión

### Servidores en Red Privada

Para abordar el problema planteado, he creado 3 servidores web que escuchan en el puerto 8080 de su host.

Para asegurar que estos servidores no tengan salida a Internet y no sean accesibles desde el exterior, implementé configuraciones de ufw en `ssh_config.sh`.

Se han establecido las siguientes reglas:

- Permitir conexiones solo desde el bastión (`proxy_serv`):
  ```
  sudo ufw allow from 192.168.100.10 to any port 22
  ```
- Permitir el puerto 8080:
  ```
  sudo ufw allow 8080
  ```
- Denegar el puerto SSH desde cualquier otra dirección:
  ```
  sudo ufw deny 22
  ```

**Nota:**
Para ejecutar la configuración de Vagrant, se debe modificar la regla de ufw para permitir conexiones desde tu IP real:
```
sudo ufw allow from <tu_dirección_IP> to any port 22
```

También instalé un servidor web Apache2 y cambié los puertos predeterminados de 80 a 8080. Toda la configuración está en `apache_install_config.sh`.

Para verificar si el servicio está en funcionamiento, realicé aprovisionamientos para cada servidor utilizando scripts `replace_index_web_serv_*.sh`, que crean un índice con el nombre de la máquina para probar el balanceador de carga.

### Creación del Bastión

Llamé a nuestro bastión `proxy_serv`, el cual actúa como intermediario entre los clientes que hacen solicitudes y los servidores que las procesan. Está configurado con Nginx como proxy y balanceador de carga. La configuración detallada se encuentra en `nginx_install_config.sh`.

## Pruebas

El acceso a los servidores privados está restringido solo desde el bastión:

```
ssh vagrant@192.168.100.100
ssh vagrant@192.168.100.101
ssh vagrant@192.168.100.102
```

Para probar el balanceador de carga en el bastión usando `curl`, instala `proxy_serv`:

```
curl -i 192.168.100.10:8000
```

Este comando verifica qué recurso se devuelve y si la solicitud fue exitosa.