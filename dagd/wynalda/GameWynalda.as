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
		public var scoreboard: Number = 0;
		//public var points: Number = 0;

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



			//var index: int = getChildIndex(hud);

			var p: Number = (health / 100); // get health as a percent 			
			// if(p < 0) p = 0;
			// if(p > 1) p = 1;
			//	hud.healthBar.scaleX = p; //set width of healthbar
			// xAtFullHealth = hud.healthBar.x;
			//hud.healthBar.x = xAtFullHealth - (1 - p) * hud.healthBar.width;
			hud.scoreboard.text = "Score:" + scoreboard;
			//trace(countdownTimerTwig);
			trace(playTimer);

			if (App.main.isPaused) return;
			playTimer++;

			countdownTimerStick--;
			if (countdownTimerStick <= 0) {
				spawnStick();
				var min: int = 150;
				if (playTimer > 300) min = 145; // lower number here = faster spawn.
				if (playTimer > 600) min = 140;
				if (playTimer > 1000) min = 135;
				if (playTimer > 1500) min = 130;
				if (playTimer > 2000) min = 125;
				if (playTimer > 2250) min = 120;
				if (playTimer > 2500) min = 115;
				if (playTimer > 2670) min = 110;
				if (playTimer > 2780) min = 105;
				if (playTimer > 2900) min = 100;
				if (playTimer > 3100) min = 95;
				if (playTimer > 3200) min = 90;
				if (playTimer > 3400) min = 85;
				if (playTimer > 3570) min = 80;
				if (playTimer > 3700) min = 75;
				if (playTimer > 4000) min = 70;
				if (playTimer > 4100) min = 65;
				if (playTimer > 4200) min = 60;
				if (playTimer > 4300) min = 55;
				if (playTimer > 4400) min = 50;
				if (playTimer > 4500) min = 45;
				if (playTimer > 4600) min = 40;
				if (playTimer > 4700) min = 35;
				if (playTimer > 4800) min = 30;
				if (playTimer > 4900) min = 25;
				if (playTimer > 5000) min = 20;
				if (playTimer > 5100) min = 15;
				if (playTimer > 5200) min = 10;
				if (playTimer > 5500) min = 5;
				if (playTimer > 7000) min = 0;
				countdownTimerStick = Math.random() * 15 + min; // can make this say Math.random() * 30 + 30; if you want to make it range of 30 to 60 frames randomly.
			}

			countdownTimerTwig--;
			if (countdownTimerTwig <= 0) {
				spawnTwig();
				var min1: int = 150;
				if (playTimer > 300) min1 = 145; // lower number here = faster spawn.
				if (playTimer > 600) min1 = 140;
				if (playTimer > 1000) min1 = 135;
				if (playTimer > 1500) min1 = 130;
				if (playTimer > 2000) min1 = 125;
				if (playTimer > 2250) min1 = 120;
				if (playTimer > 2500) min1 = 115;
				if (playTimer > 2670) min1 = 110;
				if (playTimer > 2780) min1 = 105;
				if (playTimer > 2900) min1 = 100;
				if (playTimer > 3100) min1 = 95;
				if (playTimer > 3200) min1 = 90;
				if (playTimer > 3400) min1 = 85;
				if (playTimer > 3570) min1 = 80;
				if (playTimer > 3700) min1 = 75;
				if (playTimer > 4000) min1 = 70;
				if (playTimer > 4100) min1 = 65;
				if (playTimer > 4200) min1 = 60;
				if (playTimer > 4300) min1 = 55;
				if (playTimer > 4400) min1 = 50;
				if (playTimer > 4500) min1 = 45;
				if (playTimer > 4600) min1 = 40;
				if (playTimer > 4700) min1 = 35;
				if (playTimer > 4800) min1 = 30;
				if (playTimer > 4900) min1 = 25;
				if (playTimer > 5000) min1 = 20;
				if (playTimer > 5100) min1 = 15;
				if (playTimer > 5200) min1 = 10;
				if (playTimer > 5500) min1 = 5;
				if (playTimer > 7000) min1 = 0;
				countdownTimerTwig = Math.random() * 15 + min1; // lower number here = less resistance to the min number going down.
			}

			countdownTimerCone--;
			if (countdownTimerCone <= 0) {
				spawnCone();
					var min2: int = 150;
				if (playTimer > 300) min2 = 145; // lower number here = faster spawn.
				if (playTimer > 600) min2 = 140;
				if (playTimer > 1000) min2 = 135;
				if (playTimer > 1500) min2 = 130;
				if (playTimer > 2000) min2 = 125;
				if (playTimer > 2250) min2 = 120;
				if (playTimer > 2500) min2 = 115;
				if (playTimer > 2670) min2 = 110;
				if (playTimer > 2780) min2 = 105;
				if (playTimer > 2900) min2 = 100;
				if (playTimer > 3100) min2 = 95;
				if (playTimer > 3200) min2 = 90;
				if (playTimer > 3400) min2 = 85;
				if (playTimer > 3570) min2 = 80;
				if (playTimer > 3700) min2 = 75;
				if (playTimer > 4000) min2 = 70;
				if (playTimer > 4100) min2 = 65;
				if (playTimer > 4200) min2 = 60;
				if (playTimer > 4300) min2 = 55;
				if (playTimer > 4400) min2 = 50;
				if (playTimer > 4500) min2 = 45;
				if (playTimer > 4600) min2 = 40;
				if (playTimer > 4700) min2 = 35;
				if (playTimer > 4800) min2 = 30;
				if (playTimer > 4900) min2 = 25;
				if (playTimer > 5000) min2 = 20;
				if (playTimer > 5100) min2 = 15;
				if (playTimer > 5200) min2 = 10;
				if (playTimer > 5500) min2 = 5;
				if (playTimer > 7000) min2 = 0;
				countdownTimerCone = Math.random() * 15 + min2;
			}

			countdownTimerSnowmobile--;
			if (countdownTimerSnowmobile <= 0) {
				spawnSnowmobile();
				var min3: int = 30;
				if (playTimer > 300) min3 = 15;
				if (playTimer > 600) min3 = 0;
				countdownTimerSnowmobile = Math.random() * 30 + min3;
			}

			updateSnowmobile();
			updateStick();
			updateCone();
			updateTwig();

		}

		private function spawnStick(): void {
			var st = new Stick(); // spawnin a blob
			sticks.push(st); // adding it to our collection
			addChildAt(st, 1); // adding it to our scene graph (so that it renders)
		}

		private function spawnTwig(): void {
			var t = new Twig(); // spawnin a blob
			twigs.push(t); // adding it to our collection
			addChildAt(t, 1); // adding it to our scene graph (so that it renders)
		}
		private function spawnCone(): void {
			var c = new Cone(); // spawnin a blob
			cones.push(c); // adding it to our collection
			addChildAt(c, 1); // adding it to our scene graph (so that it renders)
		}
		private function spawnSnowmobile(): void {
			var s = new Snowmobile(); // spawnin a blob
			snowmobiles.push(s); // adding it to our collection
			addChildAt(s, 1); // adding it to our scene graph (so that it renders)
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