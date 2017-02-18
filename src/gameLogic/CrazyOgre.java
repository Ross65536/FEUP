package gameLogic;

public class CrazyOgre extends Character {
	
	public CrazyOgre(int level){
		this.symbol = 'O';
		
		Coord startingPos;
		switch (level) {
		case 1:
			this.symbol = 'X'; // Ogres doesn't appear on 1st level
			startingPos = new Coord(0,0); 
			this.position = startingPos;
			break;

		default:
			break;
		}
		
	}
	
	public CrazyOgre(Coord position){
		this.symbol = 'O';
		this.position = position;
	}

}
