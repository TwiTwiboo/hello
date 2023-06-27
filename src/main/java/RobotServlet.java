

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import Model.Robot;

/**
 * Servlet implementation class RobotServlet
 */
@WebServlet("/RobotServlet")
public class RobotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    private Robot robot;

    public RobotServlet() {
        super();
        // Initialize the Robot object
        robot = new Robot(1, "BB8", "north", 0, 0, 10);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the action from the request
        String action = request.getParameter("action");

        // Perform the corresponding action on the Robot object
        if (action != null) {
            switch (action) {
                case "forward":
                    robot.goForward();
                    break;
                case "backward":
                    robot.goBackward();
                    break;
                case "left":
                    robot.goLeft();
                    break;
                case "right":
                    robot.goRight();
                    break;
            }
        }

        // Create a JSON object to hold the robot position
        JSONObject positionJson = new JSONObject();
        positionJson.put("currentPositionX", robot.getCurrentPositionX());
        positionJson.put("currentPositionY", robot.getCurrentPositionY());

        // Set the response content type to JSON
        response.setContentType("application/json");

        // Write the JSON object as the response
        response.getWriter().write(positionJson.toString());
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
