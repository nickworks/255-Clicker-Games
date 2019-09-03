package dagd.takens {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	
	public class GameTakens extends Game {

		public function GameTakens() {
				gameTitle = "Xtraterrestrial";
				creatorName = "Keith Takens";
				init();
				
		}
		
		public function init(){
			var ufo: UFO = new UFO;
				addChild(ufo);
				ufo.x = 275;
				ufo.y = 200;
		}
	}
}