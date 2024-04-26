#!/bin/bash

# Commands to update and install Apache
yum update -y
yum install -y httpd

# Commands to start and enable Apache
systemctl start httpd
systemctl enable httpd

# Writes index.html to ec2 server
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <title>My Simple Web App</title>
  <style>
    body {
      font-family: cursive;
      text-align: center;
      background-color: rgb(217, 236, 241);
      h1 {
        font-size: 50px; /* Set font size for h1 to 24 pixels */
      }
      p {
        font-size: 26px; /* Set font size for paragraphs to 16 pixels */
      }
    }
  </style>
</head>
<body>

  <h1><i>Hello World...!</i></h1>

  <p id="message">Click the button to change the message.</p>

  <button id="button">Click Me</button>

  <script>
    // Get references to the message element and button element
    var messageElement = document.getElementById('message');
    var buttonElement = document.getElementById('button');

    // Boolean variable to track the current state
    var isMessageChanged = false;

    // Add a click event listener to the button
    buttonElement.addEventListener('click', function() {
      // Check the current state
      if (isMessageChanged) {
        // Change the message to the original one
        messageElement.textContent = 'Click the button to see the message.';
      } else {
        // Change the message to the alternate one
        messageElement.textContent = 'Thanks for clicking me ;)';
      }

      // Toggle the state
      isMessageChanged = !isMessageChanged;
    });
  </script>

</body>
</html>
EOF