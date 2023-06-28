<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Robot Page</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
<!-- mb- =margin button, mr= margin right  -->
       <div class="row justify-content-center mt-3">
    	<div class="col-md-6">
        <div class="d-flex justify-content-center">
 			<button class="btn btn-primary custom-btn mx-2" onclick="moveRobot('forward')">Go Forward</button>
  			<button class="btn btn-primary custom-btn mx-2" onclick="moveRobot('backward')">Go Backward</button>
  			<button class="btn btn-primary custom-btn mx-2" onclick="moveRobot('left')">Go Left</button>
  			<button class="btn btn-primary custom-btn mx-2" onclick="moveRobot('right')">Go Right</button>
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
       
        	function drawCircle(x, y, radius, color) {
        	  context.fillStyle = color;
        	  context.beginPath();
        	  context.arc(x, y, radius, 0, 2 * Math.PI);
        	  context.closePath();
        	  context.fill();
        	}

        	function drawLine(x1, y1, x2, y2, color, lineWidth) {
        	  context.strokeStyle = color;
        	  context.lineWidth = lineWidth;
        	  context.beginPath();
        	  context.moveTo(x1, y1);
        	  context.lineTo(x2, y2);
        	  context.stroke();
        	}

        	function drawRobot() {
        	  // Clear the canvas
        	  clearCanvas();

        	  //  Body (Circle)
        	  drawCircle(currentPosition.x, currentPosition.y, 30, '#F5D04C');

        	  // Head (Half Circle)
        	  drawCircle(currentPosition.x, currentPosition.y - 35, 15, '#F5D04C');

        	  // Black eyes (Circles)
        	  drawCircle(currentPosition.x - 10, currentPosition.y - 35, 2, '#2F383B');
        	  drawCircle(currentPosition.x + 10, currentPosition.y - 35, 2, '#2F383B');

        	  // Droid Lines
        	  drawLine(currentPosition.x - 15, currentPosition.y, currentPosition.x + 15, currentPosition.y, '#2F383B', 2);
        	}

        
// The method that is not linked to the backend
        function moveRobot(direction) {
            // Update the position of the robot based on the direction input
            switch (direction) {
                case 'forward':
                    currentPosition.y -= 20; // Move the robot up
                    break;
                case 'backward':
                    currentPosition.y += 20; // Move the robot down
                    break;
                case 'left':
                    currentPosition.x -= 20; // Move the robot left
                    break;
                case 'right':
                    currentPosition.x += 20; // Move the robot right
                    break;
            }

            // Clear the canvas and redraw the robot at the new position
            clearCanvas();
            drawRobot();
        }
		     

        drawRobot(); // Initial drawing of the robot
    </script>
</body>
</html>
