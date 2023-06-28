package Model;

public class Robot {


    private String direction;
    private int currentPositionX;
    private int currentPositionY;
    private int step;

    // Constructor
    public Robot( String direction, int currentPositionX, int currentPositionY, int step) {

        this.direction = direction;
        this.currentPositionX = currentPositionX;
        this.currentPositionY = currentPositionY;
        this.step = step;
    }
    
    
    public void goForward() {
        if (direction.equals("north")) {
            currentPositionY += step;
        } else if (direction.equals("south")) {
            currentPositionY -= step;
        } else if (direction.equals("west")) {
            currentPositionX -= step;
        } else if (direction.equals("east")) {
            currentPositionX += step;
        }
    }
    
    public void goBackward() {
        if (direction.equals("north")) {
            currentPositionY -= step;
        } else if (direction.equals("south")) {
            currentPositionY += step;
        } else if (direction.equals("west")) {
            currentPositionX += step;
        } else if (direction.equals("east")) {
            currentPositionX -= step;
        }
    }
    public void goLeft() {
        if (direction.equals("north")) {
            direction = "west";
        } else if (direction.equals("south")) {
            direction = "east";
        } else if (direction.equals("west")) {
            direction = "south";
        } else if (direction.equals("east")) {
            direction = "north";
        }
    }
    
    public void goRight() {
        if (direction.equals("north")) {
            direction = "east";
        } else if (direction.equals("south")) {
            direction = "west";
        } else if (direction.equals("west")) {
            direction = "north";
        } else if (direction.equals("east")) {
            direction = "south";
        }
    }    
             
           

    // Getters and setters  

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public int getCurrentPositionX() {
        return currentPositionX;
    }

    public void setCurrentPositionX(int currentPositionX) {
        this.currentPositionX = currentPositionX;
    }

    public int getCurrentPositionY() {
        return currentPositionY;
    }

    public void setCurrentPositionY(int currentPositionY) {
        this.currentPositionY = currentPositionY;
    }

    public int getStep() {
        return step;
    }

    public void setStep(int step) {
        this.step = step;
    }
}

