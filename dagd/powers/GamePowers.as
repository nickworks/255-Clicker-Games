package dagd.powers {

	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GamePowers extends Game {

		private var evilOnes: Array = new Array(); // make an empty array for evil object #1
		private var evilTwos: Array = new Array(); // make an empty array for evil object #2
		private var evilThrees: Array = new Array(); // make an empty array for evil object #3

		public function GamePowers() {
			gameTitle = "Click...of DOOOOOOOM!"
			creatorName = "Aaron Powers"

			addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		private function gameLoop(e: Event): void {
			//1. track the passage of time
			//2. get / process user input
			//3. update all game objects/game states
			
			if(evilOnes.length < 5) spawnEvilOne();
			trace(evilOnes.length);
			for (var i: int = 0; i > evilOnes.length; i++) {
				evilOnes[i].update;
				if (evilOnes[i].isDead == true) {
					//1. remove from scene graph
					removeChild[evilOnes.i];
					//2. remove event-listeners

					//3. deref variables
					evilOnes.splice(i, 1); //removes #i from array
					i--;
				}
			}
			
			if(evilTwos.length < 5) spawnEvilTwo();
			trace(evilTwos.length);
			for (var g: int = 0; g > evilTwos.length; g++) {
				evilTwos[i].update;
				if (evilTwos[i].isDead == true) {
					//1. remove from scene graph
					removeChild[evilTwos.i];
					//2. remove event-listeners

					//3. deref variables
					evilTwos.splice(i, 1); //removes #i from array
					i--;
				}
			}

			if(evilThrees.length < 5) spawnEvilThree();
			trace(evilThrees.length);
			for (var h: int = 0; h > evilThrees.length; h++) {
				evilThrees[i].update;
				if (evilThrees[i].isDead == true) {
					//1. remove from scene graph
					removeChild[evilThrees.i];
					//2. remove event-listeners

					//3. deref variables
					evilThrees.splice(i, 1); //removes #i from array
					i--;
				}
			}
		}

		private function spawnEvilOne(): void {
			var b = new EvilOne(); // spawns a blob
			evilOnes.push(b); // adds new blob to array
			addChild(b); // adds blob to the scene graph so it renders
		}
		
		private function spawnEvilTwo(): void {
			var b = new EvilTwo(); // spawns a blob
			evilTwos.push(b); // adds new blob to array
			addChild(b); // adds blob to the scene graph so it renders
		}
		private function spawnEvilThree(): void {
			var b = new EvilThree(); // spawns a blob
			evilThrees.push(b); // adds new blob to array
			addChild(b); // adds blob to the scene graph so it renders
		}
	}
}