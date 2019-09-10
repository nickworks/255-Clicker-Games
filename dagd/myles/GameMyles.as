package dagd.myles {

	import dagd.core.Game;
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameMyles extends Game {

		private var stars: Array = new Array(); // make an empty array
        
		
		public function GameMyles() {

			creatorName = "Danny Myles";
			gameTitle = "Shooting Stars";

			addEventListener(Event.ENTER_FRAME, gameLoop);


		}
		private function gameLoop(e: Event): void {
			spawnStar();

			//trace( stars.length );

			for (var i: int = 0; i < stars.length; i++) {
				stars[i].update();
				if (stars[i].isDead === true) {

					// 1. remove from scene graph 
					removeChild(stars[i]);

					// 2. remove even-listeners
					stars[i].dispose();

					// 3. deref variables
					stars.splice(i, 1); // removing #i from array
				}
			}
		}
		private function spawnStar(): void {
			var s = new Star(); // spawning a star
			stars.push(s); // adding it to our collection (array)
			addChild(s); // adding it to our graph (so that it renders)
		}
	} // ends Star class
} // ends package