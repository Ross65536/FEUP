package gameLogic;

import java.nio.channels.ShutdownChannelGroupException;

public class Board {
	
	private char[][] board;
	private int rows;
	private int columns;
	
	public Board(int level) {

		switch (level) {
		case 1:
			
			this.board = new char[][]{
				{'X', 'X', 'X', 'X','X','X','X','X','X','X'},
				{'X',' ', ' ', ' ','I',' ','X',' ',' ','X'},
				{'X','X', 'X', ' ','X','X','X',' ',' ','X'},
				{'X',' ', 'I', ' ','I',' ','X',' ',' ','X'},
				{'X','X', 'X', ' ','X','X','X',' ',' ','X'},
				{'I',' ', ' ', ' ',' ',' ',' ',' ',' ','X'},
				{'I',' ', ' ', ' ',' ',' ',' ',' ',' ','X'},
				{'X','X', 'X', ' ','X','X','X','X',' ','X'},
				{'X',' ', 'I', ' ','I',' ','X','k',' ','X'},
				{'X', 'X', 'X', 'X','X','X','X','X','X','X'}
			};
			
			this.rows = 10;
			this.columns = 10;
			
			break;

		default:
			break;
		}
	}
	
	public void setBoardAt(Coord pos, char value){
		int x = pos.getX();
		int y = pos.getY();
		
		if(x < this.rows && x >0 && y < this.columns && y > 0 )
			board[x][y] = value;
	}
	
	public void showBoard(){
		for(int i =0; i < this.rows; i++){
			for(int j = 0; j < this.columns; j++){
				System.out.print(this.board[i][j]);
				System.out.print(" ");
			}
			System.out.println();
		}
}
	
}