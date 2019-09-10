package dagd.myles {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameMyles extends Game {

		private var stars: Array = new Array(); // make an empty array
        
		private var countdownTimer:int = 0;
		
		private var playTimer:int = 0;
		
		
		public function GameMyles() {

			creatorName = "Danny Myles";
			gameTitle = "Shooting Stars";

		}
		
		override public function onStart():void {
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		override public function onEnd():void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			
		}
		
		private function gameLoop(e: Event): void {
			if(App.main.isPaused) return;
			
			playTimer++;
			
			countdownTimer--;
			if(countdownTimer <= 0) {
				spawnStar();
				
				var min:int = 30;
				if(playTimer > 300) min = 15;
				if(playTimer > 600) min = 0;
				
				countdownTimer = Math.random() * 30 + min; // range of (min) to (min+30) frames
			}
			
			

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