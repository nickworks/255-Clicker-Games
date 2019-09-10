package dagd.petzak {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	
	public class GamePetzak extends Game {

		public function GamePetzak() {
			creatorName = "Alec Petzak";
			gameTitle = "placeholder title";
			
			var swirl: Swirl = new Swirl;
			addChild(swirl);
			swirl.x = 275;
			swirl.y = 200;			
		}
	}
}