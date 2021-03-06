package console;

import java.util.Scanner;

import gameLogic.Direction;
import gameLogic.GameConfig;

public class Interaction {
	
	private Direction direction;
	private char keyPressed;
	
	@SuppressWarnings("resource")
	public Interaction(){
		Scanner keyboard = new Scanner(System.in);
		char key = keyboard.next().charAt(0);
		this.keyPressed = key;
	}
	
	@SuppressWarnings("resource")
	public  Interaction(GameConfig gameConfig){
		final char downKey = (char) gameConfig.getDownKey();
		final char upKey =  (char) gameConfig.getUpKey();
		final char rigthKey = (char) gameConfig.getRightKey();
		final char leftKey = (char) gameConfig.getLeftKey();
		
		
		
		Scanner keyboard = new Scanner(System.in);
		char key = keyboard.next().charAt(0);
		
		key = Character.toUpperCase(key);

		if (key == downKey) {
			this.direction = Direction.DOWN;
			
		} else if (key == upKey) {
			this.direction = Direction.UP;
			
		} else if (key == rigthKey) {
			this.direction = Direction.RIGHT;
			
		} else if (key == leftKey) {
			this.direction = Direction.LEFT;
			
		} else {
			this.direction = Direction.INVALID;
		}
	}

	public Direction getDirection() {
		return direction;
	}

	public char getKeyPressed() {
		return keyPressed;
	}

}