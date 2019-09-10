package dagd.wynalda {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import dagd.wynalda.MyHUD;

	public class GameWynalda extends Game {

		//Good Things to Wack
		private var sticks: Array = new Array(); //make an empty array for sticks
		private var twigs: Array = new Array(); //make an empty array for twigs
		private var cones: Array = new Array(); //make an empty array for cones

		//Bad things to Wack
		private var snowmobiles: Array = new Array(); //make an empty array for snowmobiles

		//Spawn Limiting Timers
		private var countdownTimerStick: int = 0;
		private var countdownTimerTwig: int = 0;
		private var countdownTimerCone: int = 0;
		private var countdownTimerSnowmobile: int = 0;

		//Other Stuff
		private var playTimer: int = 0;
		private var min: int = 0;

		//GUI

		private var hud: MyHUD;
		private var health: Number = 100; // set players starting health
		public var xAtFullHealth: Number = 100;
		private var score: Number = 0;
		public var points: Number = 0;

		//Physics


		override public function onStart(): void {
			addEventListener(Event.ENTER_FRAME, gameLoop);
			hud = new MyHUD();
			addChild(hud);

			var art: Art = new Art; // create sky background variable
			addChildAt(art, 0); // sky background
			art.x = 0; // aligning background
			art.y = 0; // aligning background
			art.scaleX = 1.3; // re-sizing background
			art.scaleY = art.scaleX; // re-sizing background
		}


		public function GameWynalda() {


			creatorName = ("Jordan Wynalda"); // creator name in top right
			gameTitle = ("Tree Wacker"); // game title in top right and in main menu


		}

		private function gameLoop(e: Event): void {
			// =------ GAME LOOP Requirements -------=
			//1. track the passage of time
			//2. get / process user input
			//3. update all game objects / game state


			var index: int = getChildIndex(hud);

			var p: Number = (health / 100); // get health as a percent 			
			// if(p < 0) p = 0;
			// if(p > 1) p = 1;
			//	hud.healthBar.scaleX = p; //set width of healthbar
			// xAtFullHealth = hud.healthBar.x;
			hud.healthBar.x = xAtFullHealth - (1 - p) * hud.healthBar.width;
			hud.scoreboard.text = "score:" + score;


			if (App.main.isPaused) return;
			playTimer++;

			countdownTimerStick--;
			if (countdownTimerStick <= 0) {
				spawnStick();
				var min: int = 30;
				if (playTimer > 300) min = 15;
				if (playTimer > 600) min = 0;
				countdownTimerStick = Math.random() * 30 + min; // can make this say Math.random() * 30 + 30; if you want to make it range of 30 to 60 frames randomly.
			}

			countdownTimerTwig--;
			if (countdownTimerTwig <= 0) {
				spawnTwig();
				var min1: int = 30;
				if (playTimer > 300) min1 = 15;
				if (playTimer > 600) min1 = 0;
				countdownTimerTwig = Math.random() * 30 + min1;
			}

			countdownTimerCone--;
			if (countdownTimerCone <= 0) {
				spawnCone();
				var min2: int = 30;
				if (playTimer > 300) min2 = 15;
				if (playTimer > 600) min2 = 0;
				countdownTimerCone = Math.random() * 30 + min2;
			}

			countdownTimerSnowmobile--;
			if (countdownTimerSnowmobile <= 0) {
				spawnSnowmobile();
				var min3: int = 30;
				if (playTimer > 300) min2 = 15;
				if (playTimer > 600) min2 = 0;
				countdownTimerSnowmobile = Math.random() * 30 + min2;
			}

			updateSnowmobile();
			updateStick();
			updateCone();
			updateTwig();

		}

		private function spawnStick(): void {
			var st = new Stick(); // spawnin a blob
			sticks.push(st); // adding it to our collection
			addChild(st); // adding it to our scene graph (so that it renders)
		}

		private function spawnTwig(): void {
			var t = new Twig(); // spawnin a blob
			twigs.push(t); // adding it to our collection
			addChild(t); // adding it to our scene graph (so that it renders)
		}
		private function spawnCone(): void {
			var c = new Cone(); // spawnin a blob
			cones.push(c); // adding it to our collection
			addChild(c); // adding it to our scene graph (so that it renders)
		}
		private function spawnSnowmobile(): void {
			var s = new Snowmobile(); // spawnin a blob
			snowmobiles.push(s); // adding it to our collection
			addChild(s); // adding it to our scene graph (so that it renders)
		}

		private function updateStick(): void {
			for (var i: int = 0; i < sticks.length; i++) {
				sticks[i].update();
				if (sticks[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(sticks[i]);
					//2 remove event-listeners

					//3, deref variables
					sticks.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		private function updateTwig(): void {
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

		private function updateCone(): void {
			for (var i: int = 0; i < cones.length; i++) {
				cones[i].update();
				if (cones[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(cones[i]);
					//2 remove event-listeners

					//3, deref variables
					cones.splice(i, 1); // removing #i from array.

					i--;
				}


			}

		}

		private function updateSnowmobile(): void {
			for (var i: int = 0; i < snowmobiles.length; i++) {
				snowmobiles[i].update();
				if (snowmobiles[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(snowmobiles[i]);
					//2 remove event-listeners

					//3, deref variables
					snowmobiles.splice(i, 1); // removing #i from array.

					i--;
				}

			}

		}


		override public function onEnd(): void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);
		}





	} // end class
} // end package