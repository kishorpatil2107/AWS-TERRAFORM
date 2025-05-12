#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#echo "<h1> Terraform in one video by Kishor Patil</h1>" > /var/www/html/index.html
sudo bash -c 'cat > /var/www/html/index.html' <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Terraform by Kishor Patil</title>
  <style>
    body {
      background: linear-gradient(to right, #4facfe, #00f2fe);
      color: #fff;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    h1 {
      font-size: 3em;
      margin-bottom: 0.5em;
    }
    p {
      font-size: 1.2em;
    }
    .box {
      background-color: rgba(255, 255, 255, 0.1);
      padding: 2em;
      border-radius: 10px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
      text-align: center;
    }
  </style>
</head>
<body>
  <div class="box">
    <h1>Terraform in One Video</h1>
    <p>by Kishor Patil</p>
  </div>
</body>
</html>
EOF
