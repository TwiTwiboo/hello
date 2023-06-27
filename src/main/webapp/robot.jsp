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
    <div class="container">
        <h1 class="text-center mt-3">Robot Details</h1>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <canvas id="robotCanvas" width="600" height="600"></canvas>
            </div>
        </div>

        <div class="row justify-content-center mt-3">
            <div class="col-md-6">
                <div class="d-flex justify-content-center">
                    <button class="btn btn-primary mr-2" onclick="moveRobot('forward')">Go Forward</button>
                    <button class="btn btn-primary mr-2" onclick="moveRobot('backward')">Go Backward</button>
                    <button class="btn btn-primary mr-2" onclick="moveRobot('left')">Go Left</button>
                    <button class="btn btn-primary" onclick="moveRobot('right')">Go Right</button>
                </div>
            </div>
        </div>
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

            //  Body (Circle)
            context.fillStyle = '#F5D04C';
            context.beginPath();
            context.arc(currentPosition.x, currentPosition.y, 30, 0, 2 * Math.PI);//180*2=360
            context.closePath();
            context.fill();

            // Head (Half Circle)
            context.fillStyle = '#F5D04C';
            context.beginPath();
            context.arc(currentPosition.x, currentPosition.y - 35, 15, Math.PI, 2 * Math.PI);
            context.closePath();
            context.fill();

            // black eyes(Circle)
            context.fillStyle = '#2F383B';
            context.beginPath();
            context.arc(currentPosition.x - 10, currentPosition.y - 35, 2, 0, 2 * Math.PI);
            context.closePath();
            context.fill();

            context.fillStyle = '#2F383B';
            context.beginPath();
            context.arc(currentPosition.x + 10, currentPosition.y - 35, 2, 0, 2 * Math.PI);
            context.closePath();
            context.fill();

            // Droid Lines
            context.strokeStyle = '#2F383B';
            context.lineWidth = 2;

            //belly
            context.beginPath();
            context.moveTo(currentPosition.x - 15, currentPosition.y);
            context.lineTo(currentPosition.x + 15, currentPosition.y);
            context.stroke();
			//feet
            context.beginPath();
            context.moveTo(currentPosition.x - 10, currentPosition.y + 25);
            context.lineTo(currentPosition.x - 20, currentPosition.y + 35);
            context.stroke();

            context.beginPath();
            context.moveTo(currentPosition.x + 10, currentPosition.y + 25);
            context.lineTo(currentPosition.x + 20, currentPosition.y + 35);
            context.stroke();
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
