package dagd.wynalda {

	import dagd.core.Game;

	import flash.display.MovieClip;
	import flash.events.Event;


	public class GameWynalda extends Game {

		private var blobs: Array = new Array(); //make an empty array
		private var twigs: Array = new Array(); //make an empty array
		private var branchs: Array = new Array(); //make an empty array


		public function GameWynalda() {
			addEventListener(Event.ENTER_FRAME, gameLoop);

			creatorName = ("Jordan Wynalda");
			gameTitle = ("Tree Wacker");

			var art: Art = new Art; // create sky background variable
			addChild(art); // sky background
			art.x = 0; // aligning background
			art.y = 0; // aligning background

			scaleX = 1.3; // re-sizing background
			scaleY = scaleX; // re-sizing background

		}

		private function gameLoop(e: Event): void {
			// =------ GAME LOOP Requirements -------=
			//1. track the passage of time
			//2. get / process user input
			//3. update all game objects / game state

			spawnBlob();
			spawnTwig();
			spawnBranch();
			updateStick();
			updateBranch();
			updateTwig();







		}

		private function spawnBlob(): void {
			var b = new Blob(); // spawnin a blob
			blobs.push(b); // adding it to our collection
			addChild(b); // adding it to our scene graph (so that it renders)
		}

		private function spawnTwig(): void {
			var t = new Twig(); // spawnin a blob
			twigs.push(t); // adding it to our collection
			addChild(t); // adding it to our scene graph (so that it renders)
		}
		private function spawnBranch(): void {
			var bv = new Branch(); // spawnin a blob
			branchs.push(bv); // adding it to our collection
			addChild(bv); // adding it to our scene graph (so that it renders)
		}

		private function updateStick() {
			for (var i: int = 0; i < blobs.length; i++) {
				blobs[i].update();
				if (blobs[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(blobs[i]);
					//2 remove event-listeners

					//3, deref variables
					blobs.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		private function updateTwig() {
			for (var i: int = 0; i < twigs.length; i++) {
				twigs[i].update();
				if (twigs[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(twigs[i]);
					//2 remove event-listeners

					//3, deref variables
					twigs.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		private function updateBranch() {
			for (var i: int = 0; i < branchs.length; i++) {
				branchs[i].update();
				if (branchs[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(branchs[i]);
					//2 remove event-listeners

					//3, deref variables
					branchs.splice(i, 1); // removing #i from array.

					i--;
				}


			}

		}



	}
}