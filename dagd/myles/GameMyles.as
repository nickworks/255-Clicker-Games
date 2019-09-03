package dagd.myles {
	
	import dagd.core.Game;
	
	public class GameMyles extends Game {
		
		var s:Smiley

		public function GameMyles() {
			creatorName = "Danny Myles";
			gameTitle = "placeholder";
			
			s = new Smiley();
			s.x = 275;
			s.y = 200;
			addChild(s);
			
			
		}
	}
}