<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Robot Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/robot.css">   
</head>
<body>
   
    <canvas id="robotCanvas" width="800" height="800"></canvas>

    <div class="mt-3">
        <button onclick="moveRobot('forward')">Go Forward</button>
        <button onclick="moveRobot('backward')">Go Backward</button>
        <button onclick="moveRobot('left')">Go Left</button>
        <button onclick="moveRobot('right')">Go Right</button>
    </div>

    <script>
        var canvas = document.getElementById('robotCanvas');
        var context = canvas.getContext('2d');
        var currentPosition = { x: canvas.width / 2, y: canvas.height / 2 };

        function clearCanvas() {
            context.clearRect(0, 0, canvas.width, canvas.height);
        }

        function drawRobot() {
            // Clear the canvas
            context.clearRect(0, 0, canvas.width, canvas.height);

            // Draw the robot image on the canvas
            var robotImage = new Image();
            robotImage.onload = function() {
                // Specify the desired width and height for the robot image
                var imageWidth = 300;
                var imageHeight = 300;

                // Calculate the position to draw the image centered at the current position
                var drawX = currentPosition.x - imageWidth / 2;
                var drawY = currentPosition.y - imageHeight / 2;

                // Draw the image
                context.drawImage(robotImage, drawX, drawY, imageWidth, imageHeight);
            };

            // Set the source of the robot image
            robotImage.src = 'images/bb8.png';
        }
        function moveRobot(direction) {
            // Make an AJAX request to the RobotServlet
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'RobotServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('action=' + direction);

            // Update the position of the robot based on the response from the server
            xhr.onload = function() {
                if (xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    currentPosition.x = response.currentPositionX;
                    currentPosition.y = response.currentPositionY;

                    // Clear the canvas and redraw the robot at the new position
                    clearCanvas();
                    drawRobot();
                }
            };
        }

        drawRobot(); // Initial drawing of the robot
    </script>
</body>
</html>
