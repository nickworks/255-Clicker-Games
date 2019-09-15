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
		private var snowmobiles2: Array = new Array(); //make an empty array for snowmobiles
		private var snowmobiles3: Array = new Array(); //make an empty array for snowmobiles

		//Spawn Limiting Timers
		private var countdownTimerStick: int = 0;
		private var countdownTimerTwig: int = 0;
		private var countdownTimerCone: int = 0;
		private var countdownTimerSnowmobile: int = 0;
		private var countdownTimerSnowmobile2: int = 0;
		private var countdownTimerSnowmobile3: int = 0;

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
			//trace(playTimer);

			if (App.main.isPaused) return;
			playTimer++;

			countdownTimerStick--;
			if (countdownTimerStick <= 0) {
				spawnStick();
				var min: int = 350;
				if (playTimer > 300) min = 345; // lower number here = faster spawn.
				if (playTimer > 600) min = 340;
				if (playTimer > 1000) min = 335;
				if (playTimer > 1500) min = 330;
				if (playTimer > 2000) min = 325;
				if (playTimer > 2250) min = 320;
				if (playTimer > 2500) min = 315;
				if (playTimer > 2670) min = 310;
				if (playTimer > 2780) min = 305;
				if (playTimer > 2900) min = 300;
				if (playTimer > 3100) min = 295;
				if (playTimer > 3200) min = 290;
				if (playTimer > 3400) min = 285;
				if (playTimer > 3570) min = 280;
				if (playTimer > 3700) min = 275;
				if (playTimer > 4000) min = 270;
				if (playTimer > 4100) min = 265;
				if (playTimer > 4200) min = 260;
				if (playTimer > 4300) min = 255;
				if (playTimer > 4400) min = 250;
				if (playTimer > 4500) min = 245;
				if (playTimer > 4600) min = 240;
				if (playTimer > 4700) min = 235;
				if (playTimer > 4800) min = 230;
				if (playTimer > 4900) min = 225;
				if (playTimer > 5000) min = 220;
				if (playTimer > 5100) min = 215;
				if (playTimer > 5200) min = 210;
				if (playTimer > 5500) min = 205;
				if (playTimer > 6000) min = 200;
				if (playTimer > 6500) min = 195;
				if (playTimer > 7000) min = 190;
				if (playTimer > 7200) min = 185;
				if (playTimer > 7400) min = 180;
				if (playTimer > 7600) min = 175;
				if (playTimer > 7800) min = 170;
				if (playTimer > 8000) min = 165;
				if (playTimer > 8200) min = 160;
				if (playTimer > 8400) min = 155;
				if (playTimer > 8600) min = 150;
				if (playTimer > 8800) min = 145;
				if (playTimer > 9000) min = 140;
				if (playTimer > 9200) min = 135;
				if (playTimer > 9400) min = 130;
				if (playTimer > 9600) min = 125;
				if (playTimer > 9800) min = 120;
				if (playTimer > 10000) min = 115;
				if (playTimer > 12000) min = 110;
				if (playTimer > 14000) min = 105;
				if (playTimer > 18000) min = 50;	
				
				countdownTimerStick = Math.random() * 15 + min; // can make this say Math.random() * 30 + 30; if you want to make it range of 30 to 60 frames randomly.
			}

			countdownTimerTwig--;
			if (countdownTimerTwig <= 0) {
				spawnTwig();
				var min1: int = 350;
		if (playTimer > 300) min1 = 345; // lower number here = faster spawn.
				if (playTimer > 300) min1 = 345; // lower number here = faster spawn.
				if (playTimer > 600) min1 = 340;
				if (playTimer > 1000) min1 = 335;
				if (playTimer > 1500) min1 = 330;
				if (playTimer > 2000) min1 = 325;
				if (playTimer > 2250) min1 = 320;
				if (playTimer > 2500) min1 = 315;
				if (playTimer > 2670) min1 = 310;
				if (playTimer > 2780) min1 = 305;
				if (playTimer > 2900) min1 = 300;
				if (playTimer > 3100) min1 = 295;
				if (playTimer > 3200) min1 = 290;
				if (playTimer > 3400) min1 = 285;
				if (playTimer > 3570) min1 = 280;
				if (playTimer > 3700) min1 = 275;
				if (playTimer > 4000) min1 = 270;
				if (playTimer > 4100) min1 = 265;
				if (playTimer > 4200) min1 = 260;
				if (playTimer > 4300) min1 = 255;
				if (playTimer > 4400) min1 = 250;
				if (playTimer > 4500) min1 = 245;
				if (playTimer > 4600) min1 = 240;
				if (playTimer > 4700) min1 = 235;
				if (playTimer > 4800) min1 = 230;
				if (playTimer > 4900) min1 = 225;
				if (playTimer > 5000) min1 = 220;
				if (playTimer > 5100) min1 = 215;
				if (playTimer > 5200) min1 = 210;
				if (playTimer > 5500) min1 = 205;
				if (playTimer > 6000) min1 = 200;
				if (playTimer > 6500) min1 = 195;
				if (playTimer > 7000) min1 = 190;
				if (playTimer > 7200) min1 = 185;
				if (playTimer > 7400) min1 = 180;
				if (playTimer > 7600) min1 = 175;
				if (playTimer > 7800) min1 = 170;
				if (playTimer > 8000) min1 = 165;
				if (playTimer > 8200) min1 = 160;
				if (playTimer > 8400) min1 = 155;
				if (playTimer > 8600) min1 = 150;
				if (playTimer > 8800) min1 = 145;
				if (playTimer > 9000) min1 = 140;
				if (playTimer > 9200) min1 = 135;
				if (playTimer > 9400) min1 = 130;
				if (playTimer > 9600) min1 = 125;
				if (playTimer > 9800) min1 = 120;
				if (playTimer > 10000) min1 = 115;
				if (playTimer > 12000) min1 = 110;
				if (playTimer > 14000) min1 = 105;
				if (playTimer > 18000) min1 = 50;
				countdownTimerTwig = Math.random() * 15 + min1; // lower number here = less resistance to the min number going down.
			}

			countdownTimerCone--;
			if (countdownTimerCone <= 0) {
				spawnCone();
					var min2: int = 350;
			if (playTimer > 300) min2 = 345; // lower number here = faster spawn.
				if (playTimer > 600) min2 = 340;
				if (playTimer > 1000) min2 = 335;
				if (playTimer > 1500) min2 = 330;
				if (playTimer > 2000) min2 = 325;
				if (playTimer > 2250) min2 = 320;
				if (playTimer > 2500) min2 = 315;
				if (playTimer > 2670) min2 = 310;
				if (playTimer > 2780) min2 = 305;
				if (playTimer > 2900) min2 = 300;
				if (playTimer > 3100) min2 = 295;
				if (playTimer > 3200) min2 = 290;
				if (playTimer > 3400) min2 = 285;
				if (playTimer > 3570) min2 = 280;
				if (playTimer > 3700) min2 = 275;
				if (playTimer > 4000) min2 = 270;
				if (playTimer > 4100) min2 = 265;
				if (playTimer > 4200) min2 = 260;
				if (playTimer > 4300) min2 = 255;
				if (playTimer > 4400) min2 = 250;
				if (playTimer > 4500) min2 = 245;
				if (playTimer > 4600) min2 = 240;
				if (playTimer > 4700) min2 = 235;
				if (playTimer > 4800) min2 = 230;
				if (playTimer > 4900) min2 = 225;
				if (playTimer > 5000) min2 = 220;
				if (playTimer > 5100) min2 = 215;
				if (playTimer > 5200) min2 = 210;
				if (playTimer > 5500) min2 = 205;
				if (playTimer > 6000) min2 = 200;
				if (playTimer > 6500) min2 = 195;
				if (playTimer > 7000) min2 = 190;
				if (playTimer > 7200) min2 = 185;
				if (playTimer > 7400) min2 = 180;
				if (playTimer > 7600) min2 = 175;
				if (playTimer > 7800) min2 = 170;
				if (playTimer > 8000) min2 = 165;
				if (playTimer > 8200) min2 = 160;
				if (playTimer > 8400) min2 = 155;
				if (playTimer > 8600) min2 = 150;
				if (playTimer > 8800) min2 = 145;
				if (playTimer > 9000) min2 = 140;
				if (playTimer > 9200) min2 = 135;
				if (playTimer > 9400) min2 = 130;
				if (playTimer > 9600) min2 = 125;
				if (playTimer > 9800) min2 = 120;
				if (playTimer > 10000) min2 = 115;
				if (playTimer > 12000) min2 = 110;
				if (playTimer > 14000) min2 = 105;
				if (playTimer > 18000) min2 = 50;
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
			countdownTimerSnowmobile2--;
			if (countdownTimerSnowmobile2 <= 0) {
				spawnSnowmobile2();
				var min4: int = 30;
				if (playTimer > 300) min4 = 15;
				if (playTimer > 600) min4 = 0;
				countdownTimerSnowmobile2 = Math.random() * 30 + min4;
			}
				countdownTimerSnowmobile3--;
			if (countdownTimerSnowmobile3 <= 0) {
				spawnSnowmobile3();
				var min5: int = 30;
				if (playTimer > 300) min5 = 15;
				if (playTimer > 600) min5 = 0;
				countdownTimerSnowmobile3 = Math.random() * 30 + min5;
			}

			updateSnowmobile();
			updateSnowmobile2();
			updateSnowmobile3();
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
		private function spawnSnowmobile2(): void {
			var s2 = new Snowmobile2(); // spawnin a blob
			snowmobiles2.push(s2); // adding it to our collection
			addChildAt(s2, 1); // adding it to our scene graph (so that it renders)
		}
			private function spawnSnowmobile3(): void {
			var s3 = new Snowmobile3(); // spawnin a blob
			snowmobiles3.push(s3); // adding it to our collection
			addChildAt(s3, 1); // adding it to our scene graph (so that it renders)
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
		private function updateSnowmobile2(): void {
			for (var i: int = 0; i < snowmobiles2.length; i++) {
				snowmobiles2[i].update();
				if (snowmobiles2[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(snowmobiles2[i]);
					//2 remove event-listeners

					//3, deref variables
					snowmobiles2.splice(i, 1); // removing #i from array.

					i--;
				}

			}

		}
			private function updateSnowmobile3(): void {
			for (var i: int = 0; i < snowmobiles3.length; i++) {
				snowmobiles3[i].update();
				if (snowmobiles3[i].isDead == true) {
					//remove blob #i !!

					//1. remove from scene graph
					removeChild(snowmobiles3[i]);
					//2 remove event-listeners

					//3, deref variables
					snowmobiles3.splice(i, 1); // removing #i from array.

					i--;
				}

			}

		}


		override public function onEnd(): void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);
		}





	} // end class
} // end package