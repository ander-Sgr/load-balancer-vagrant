#!/bin/bash

cat <<EOL | sudo tee /var/www/html/index.html
<html>
  <body>
    <h1>Hello from server 2</h1>
    <p>This request was served by server web_serv_2.</p>
  </body>
</html>
EOL

sudo systemctl restart apache2
