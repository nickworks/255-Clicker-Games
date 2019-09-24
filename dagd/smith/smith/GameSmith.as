package dagd.smith {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class GameSmith extends Game {
		
		public var start: Array = new Array(); // array to hold stars
		
		public function GameSmith() {
			creatorName = "Antonio Smith";
			gameTitle = "Star Chaser";
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function gameLoop(e: Event): void {
			spawnStar();
			for (var i: int = 0; i < stars.length; i++) {
				stars[i].isDead == true) {
					removeChild(stars[i]);
					stars[i].cleanup();
					stars.splice(i, 1);
				}
			}
		} // end gameLoop
		
		private function spawnStar(): void {
			var s  = new Star();
			star.push(s);
			addChild(s);
		}
		
	}
}