package dagd.wynalda {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import dagd.wynalda.MyHUD;
	import flash.text.TextFieldAutoSize;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class GameWynalda extends Game {

		//Good Things to Wack
		private var sticks: Array = new Array(); //make an empty array for sticks
		private var twigs: Array = new Array(); //make an empty array for twigs
		private var cones: Array = new Array(); //make an empty array for cones

		//Bad things to Wack
		private var snowmobiles: Array = new Array(); //make an empty array for snowmobiles
		private var snowmobiles2: Array = new Array(); //make an empty array for snowmobiles2
		private var snowmobiles3: Array = new Array(); //make an empty array for snowmobiles3

		//Spawn Limiting Timers
		private var countdownTimerStick: int = 0;
		private var countdownTimerTwig: int = 0;
		private var countdownTimerCone: int = 0;
		private var countdownTimerSnowmobile: int = 0;
		private var countdownTimerSnowmobile2: int = 0;
		private var countdownTimerSnowmobile3: int = 0;
		private var countdownTimerWave: int = 0;

		//Other Stuff
		private var playTimer: int = 0;
		private var min: int = 0;

		//GUI
		private var hud: MyHUD;
		public var score: Number = 0;
		public var wave: Number = 0;
		public var health: Number = 15;

		//SOUND
		public var BGMusic: SoundChannel;


		override public function onStart(): void { // This stuff happens when my game starts
			addEventListener(Event.ENTER_FRAME, gameLoop);
			var music1 = new Music1();
			var st: SoundTransform = new SoundTransform();
			st.volume = 0.1;
			BGMusic = music1.play(0, 10, st);


			hud = new MyHUD();
			addChild(hud);

			hud.scoreboard.autoSize = TextFieldAutoSize.RIGHT;
			hud.waveNumber.autoSize = TextFieldAutoSize.CENTER;
			hud.healthbar.autoSize = TextFieldAutoSize.LEFT;

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


			if (App.main.isPaused) {
				BGMusic.stop();
				return; // make pause menu work.
			}

			//BREAKS IN BETWEEN WAVES!!
			if (playTimer < 2000 && wave < 1) {
				wave = 1;
				//countdownTimerWave = 1000;
			}
			if (playTimer > 2000 && wave < 2) {
				wave = 2;
				countdownTimerWave = 500;
			}
			if (playTimer > 4500 && wave < 3) {
				wave = 3;
				countdownTimerWave = 500;
			}
			if (playTimer > 7000 && wave < 4) {
				wave = 4;
				countdownTimerWave = 500;
			}
			if (playTimer > 9500 && wave < 5) {
				wave = 5;
				countdownTimerWave = 500;
			}
			if (playTimer > 12000 && wave < 6) {
				wave = 6;
				countdownTimerWave = 500;
			}
			if (playTimer > 155000 && wave < 7) {
				wave = 7;
				countdownTimerWave = 500;
			}
			//END OF BREAKS IN BETWEEN WAVES

			if (health <= 0){
				if(hud.gameOverArt.visible == false) {
					hud.gameOverArt.visible = true;
					hud.gameOverArt.finalWave.text = "YOU REACHED WAVE:" + wave;
					hud.gameOverArt.finalScore.text = "FINALSCORE:" + score;
				}
				return; //PAUSES GAME WHEN HEALTH HITS 0
			}

			var index: int = getChildIndex(hud);
			hud.scoreboard.text = "Score:" + score; // making scoreboard show	
			hud.waveNumber.text = "Wave:" + wave;
			hud.healthbar.scaleX = health / 15;

			playTimer++; // increase playtimer.
			if (countdownTimerWave > 0) {
				countdownTimerWave--;
			}
			//trace(countdownTimerTwig); // used for testing
			trace(playTimer); // used for testing


			//SPAWN COUNTDOWN TIMER TO MAKE THINGS SPAWN SLOW THEN SPEED UP (SNOWMOBILES DONT CHANGE BUT THATS INTENTIONAL)
			spawnFriends();

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
				var min4: int = 105;
				if (playTimer > 300) min4 = 100;
				if (playTimer > 600) min4 = 50;
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

			// CALL THE UPDATE FUNCTIONS TO THE UPDATING HAPPENS
			updateSnowmobile();
			updateSnowmobile2();
			updateSnowmobile3();
			updateStick();
			updateCone();
			updateTwig();

		}


		//SPAWN THE THINGS, ALL THE THINGS!!
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
			addChildAt(s, 2); // adding it to our scene graph (so that it renders)
		}
		private function spawnSnowmobile2(): void {
			var s2 = new Snowmobile2(); // spawnin a blob
			snowmobiles2.push(s2); // adding it to our collection
			addChildAt(s2, 2); // adding it to our scene graph (so that it renders)
		}
		private function spawnSnowmobile3(): void {
			var s3 = new Snowmobile3(); // spawnin a blob
			snowmobiles3.push(s3); // adding it to our collection
			addChildAt(s3, 2); // adding it to our scene graph (so that it renders)
		}

		//UPDATE THE THINGS, MAKE THE WORK!!
		private function updateStick(): void {
			for (var i: int = 0; i < sticks.length; i++) {
				sticks[i].update();
				if (sticks[i].isDead == true) {
					//1. remove from scene graph
					//2 remove event-listeners
					//3, deref variables

					if (sticks[i].points > 0) { //SCORE!
						score += sticks[i].points; // SCORE!!
					}
					if (sticks[i].healths > 0) { //HEALTH!!
						health -= sticks[i].healths; //HEALTH!!
					}

					//	var a = new AnimSplatter();
					//	a.x = twigs[i].x;
					//  a.y = twigs[i].y;
					//	addChild(a);
					//	anims.push(a);
					//}					

					removeChild(sticks[i]); //remove from memory.
					sticks.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		private function updateTwig(): void {
			for (var i: int = 0; i < twigs.length; i++) {
				twigs[i].update();
				if (twigs[i].isDead == true) {
					//1. remove from scene graph
					//2. remove event-listeners
					//3. deref variables

					if (twigs[i].points > 0) { //SCORE!
						score += twigs[i].points; // SCORE!!
					}
					if (twigs[i].healths > 0) { //HEALTH!!
						health -= twigs[i].healths; //HEALTH!!
					}

					//	var a = new AnimSplatter();
					//	a.x = twigs[i].x;
					//  a.y = twigs[i].y;
					//	addChild(a);
					//	anims.push(a);
					//}

					removeChild(twigs[i]); //remove from memory. 	
					twigs.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		private function updateCone(): void {
			for (var i: int = 0; i < cones.length; i++) {
				cones[i].update();
				if (cones[i].isDead == true) {
					//1. remove from scene graph
					//2. remove event-listeners
					//3. deref variables

					if (cones[i].points > 0) { //SCORE!
						score += cones[i].points; // SCORE!!
					}
					if (cones[i].healths > 0) { //HEALTH!
						health -= cones[i].healths; //HEALTH!!
					}

					//	var a = new AnimSplatter();
					//	a.x = twigs[i].x;
					//  a.y = twigs[i].y;
					//	addChild(a);
					//	anims.push(a);
					//}

					removeChild(cones[i]); //remove from memory. 	
					cones.splice(i, 1); // removing #i from array.

					i--;
				}


			}
		}

		public function updateSnowmobile(): void {
			for (var i: int = 0; i < snowmobiles.length; i++) {
				snowmobiles[i].update();
				if (snowmobiles[i].isDead == true) {
					//1. remove from scene graph
					//2. remove event-listeners
					//3. deref variables

					if (snowmobiles[i].points > 0) { //SCORE!
						score -= snowmobiles[i].points; // SCORE!!
					}

					removeChild(snowmobiles[i]); //remove from memory. 
					snowmobiles.splice(i, 1); // removing #i from array.

					i--;
				}

			}

		}
		public function updateSnowmobile2(): void {
			for (var i: int = 0; i < snowmobiles2.length; i++) {
				snowmobiles2[i].update();
				if (snowmobiles2[i].isDead == true) {
					//1. remove from scene graph
					//2. remove event-listeners
					//3. deref variables

					if (snowmobiles2[i].points > 0) { //SCORE!
						score -= snowmobiles2[i].points; // SCORE!!
					}

					removeChild(snowmobiles2[i]); //remove from memory. 
					snowmobiles2.splice(i, 1); // removing #i from array. 

					i--;
				}

			}

		}
		public function updateSnowmobile3(): void {
			for (var i: int = 0; i < snowmobiles3.length; i++) {
				snowmobiles3[i].update();
				if (snowmobiles3[i].isDead == true) {
					//1. remove from scene graph
					//2. remove event-listeners
					//3. deref variables

					if (snowmobiles3[i].points > 0) { //SCORE!
						score -= snowmobiles3[i].points; // SCORE!!
					}

					removeChild(snowmobiles3[i]); //remove from memory. 
					snowmobiles3.splice(i, 1); // removing #i from array. 

					i--;
				}

			}

		}



		public function spawnFriends() {
			if (countdownTimerWave > 0) {
				return;
			}

			countdownTimerStick--;
			if (countdownTimerStick <= 0) {
				spawnStick();
				var min: int = 350;
				if (playTimer > 200) min = 345; // lower number here = faster spawn.
				if (playTimer > 400) min = 340;
				if (playTimer > 600) min = 335;
				if (playTimer > 800) min = 330;
				if (playTimer > 1000) min = 325;
				if (playTimer > 1200) min = 320;
				if (playTimer > 1400) min = 315;
				if (playTimer > 1600) min = 310;
				if (playTimer > 1800) min = 305;
				if (playTimer > 2000) min = 300;
				//END OF WAVE 1
				if (playTimer > 2700) min = 295;
				if (playTimer > 2900) min = 290;
				if (playTimer > 3100) min = 285;
				if (playTimer > 3300) min = 280;
				if (playTimer > 3500) min = 275;
				if (playTimer > 3700) min = 270;
				if (playTimer > 3900) min = 265;
				if (playTimer > 4100) min = 260;
				if (playTimer > 4300) min = 255;
				if (playTimer > 4500) min = 250;
				//END OF WAVE 2
				if (playTimer > 5200) min = 245;
				if (playTimer > 5400) min = 240;
				if (playTimer > 5600) min = 235;
				if (playTimer > 5800) min = 230;
				if (playTimer > 6000) min = 225;
				if (playTimer > 6200) min = 220;
				if (playTimer > 6400) min = 215;
				if (playTimer > 6600) min = 210;
				if (playTimer > 6800) min = 205;
				if (playTimer > 7000) min = 200;
				//END OF WAVE 3
				if (playTimer > 7700) min = 200;
				if (playTimer > 7900) min = 195;
				if (playTimer > 8100) min = 190;
				if (playTimer > 8300) min = 185;
				if (playTimer > 8500) min = 180;
				if (playTimer > 8700) min = 175;
				if (playTimer > 8900) min = 170;
				if (playTimer > 9100) min = 165;
				if (playTimer > 9300) min = 160;
				if (playTimer > 9500) min = 155;
				//END OF WAVE 4
				if (playTimer > 10200) min = 150;
				if (playTimer > 10400) min = 145;
				if (playTimer > 10600) min = 140;
				if (playTimer > 10800) min = 135;
				if (playTimer > 11000) min = 130;
				if (playTimer > 11200) min = 125;
				if (playTimer > 11400) min = 120;
				if (playTimer > 11600) min = 115;
				if (playTimer > 11800) min = 110;
				if (playTimer > 12000) min = 105;
				//END OF WAVE 5
				if (playTimer > 12700) min = 100;
				if (playTimer > 12900) min = 95;
				if (playTimer > 13100) min = 90;
				if (playTimer > 13300) min = 85;
				if (playTimer > 13500) min = 80;
				if (playTimer > 13700) min = 75;
				if (playTimer > 13900) min = 70;
				if (playTimer > 14100) min = 65;
				if (playTimer > 14300) min = 60;
				if (playTimer > 14500) min = 55;
				//END OF WAVE 6
				if (playTimer > 16000) min = 10;
				//FINAL WAVE. PLAY TILL YOU LOSE.

				countdownTimerStick = Math.random() * 15 + min; // can make this say Math.random() * 30 + 30; if you want to make it range of 30 to 60 frames randomly.
			}

			countdownTimerTwig--;
			if (countdownTimerTwig <= 0) {
				spawnTwig();
				var min1: int = 350;
				if (playTimer > 200) min1 = 345; // lower number here = faster spawn.
				if (playTimer > 400) min1 = 340;
				if (playTimer > 600) min1 = 335;
				if (playTimer > 800) min1 = 330;
				if (playTimer > 1000) min1 = 325;
				if (playTimer > 1200) min1 = 320;
				if (playTimer > 1400) min1 = 315;
				if (playTimer > 1600) min1 = 310;
				if (playTimer > 1800) min1 = 305;
				if (playTimer > 2000) min1 = 300;
				//END OF WAVE 1
				if (playTimer > 2700) min1 = 295;
				if (playTimer > 2900) min1 = 290;
				if (playTimer > 3100) min1 = 285;
				if (playTimer > 3300) min1 = 280;
				if (playTimer > 3500) min1 = 275;
				if (playTimer > 3700) min1 = 270;
				if (playTimer > 3900) min1 = 265;
				if (playTimer > 4100) min1 = 260;
				if (playTimer > 4300) min1 = 255;
				if (playTimer > 4500) min1 = 250;
				//END OF WAVE 2
				if (playTimer > 5200) min1 = 245;
				if (playTimer > 5400) min1 = 240;
				if (playTimer > 5600) min1 = 235;
				if (playTimer > 5800) min1 = 230;
				if (playTimer > 6000) min1 = 225;
				if (playTimer > 6200) min1 = 220;
				if (playTimer > 6400) min1 = 215;
				if (playTimer > 6600) min1 = 210;
				if (playTimer > 6800) min1 = 205;
				if (playTimer > 7000) min1 = 200;
				//END OF WAVE 3
				if (playTimer > 7700) min1 = 200;
				if (playTimer > 7900) min1 = 195;
				if (playTimer > 8100) min1 = 190;
				if (playTimer > 8300) min1 = 185;
				if (playTimer > 8500) min1 = 180;
				if (playTimer > 8700) min1 = 175;
				if (playTimer > 8900) min1 = 170;
				if (playTimer > 9100) min1 = 165;
				if (playTimer > 9300) min1 = 160;
				if (playTimer > 9500) min1 = 155;
				//END OF WAVE 4
				if (playTimer > 10200) min1 = 150;
				if (playTimer > 10400) min1 = 145;
				if (playTimer > 10600) min1 = 140;
				if (playTimer > 10800) min1 = 135;
				if (playTimer > 11000) min1 = 130;
				if (playTimer > 11200) min1 = 125;
				if (playTimer > 11400) min1 = 120;
				if (playTimer > 11600) min1 = 115;
				if (playTimer > 11800) min1 = 110;
				if (playTimer > 12000) min1 = 105;
				//END OF WAVE 5
				if (playTimer > 12700) min1 = 100;
				if (playTimer > 12900) min1 = 95;
				if (playTimer > 13100) min1 = 90;
				if (playTimer > 13300) min1 = 85;
				if (playTimer > 13500) min1 = 80;
				if (playTimer > 13700) min1 = 75;
				if (playTimer > 13900) min1 = 70;
				if (playTimer > 14100) min1 = 65;
				if (playTimer > 14300) min1 = 60;
				if (playTimer > 14500) min1 = 55;
				//END OF WAVE 6
				if (playTimer > 16000) min1 = 10;
				//FINAL WAVE. PLAY TILL YOU LOSE.

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
				//END OF WAVE 1
				if (playTimer > 4700) min2 = 295;
				if (playTimer > 4900) min2 = 290;
				if (playTimer > 5400) min2 = 285;
				if (playTimer > 5570) min2 = 280;
				if (playTimer > 5700) min2 = 275;
				if (playTimer > 6000) min2 = 270;
				if (playTimer > 6500) min2 = 265;
				if (playTimer > 7200) min2 = 260;
				if (playTimer > 7500) min2 = 255;
				if (playTimer > 7700) min2 = 250;
				//END OF WAVE 2
				if (playTimer > 9500) min2 = 245;
				if (playTimer > 9650) min2 = 240;
				if (playTimer > 9800) min2 = 235;
				if (playTimer > 9950) min2 = 230;
				if (playTimer > 10000) min2 = 225;
				if (playTimer > 10500) min2 = 220;
				if (playTimer > 11000) min2 = 215;
				if (playTimer > 11500) min2 = 210;
				if (playTimer > 12000) min2 = 205;
				if (playTimer > 12500) min2 = 200;
				//END OF WAVE 3
				if (playTimer > 14300) min2 = 200;
				if (playTimer > 13900) min2 = 195;
				if (playTimer > 14300) min2 = 190;
				if (playTimer > 14800) min2 = 185;
				if (playTimer > 14900) min2 = 180;
				if (playTimer > 15500) min2 = 175;
				if (playTimer > 16100) min2 = 170;
				if (playTimer > 16200) min2 = 165;
				if (playTimer > 16500) min2 = 160;
				if (playTimer > 17300) min2 = 155;
				//END OF WAVE 4
				if (playTimer > 20000) min2 = 150;
				if (playTimer > 21000) min2 = 145;
				if (playTimer > 22300) min2 = 140;
				if (playTimer > 22800) min2 = 135;
				if (playTimer > 23900) min2 = 130;
				if (playTimer > 24500) min2 = 125;
				if (playTimer > 25100) min2 = 120;
				if (playTimer > 25200) min2 = 115;
				if (playTimer > 25500) min2 = 110;
				if (playTimer > 26000) min2 = 105;
				//END OF WAVE 5
				if (playTimer > 28000) min1 = 100;
				if (playTimer > 28400) min2 = 95;
				if (playTimer > 28800) min2 = 90;
				if (playTimer > 29200) min2 = 85;
				if (playTimer > 29600) min2 = 80;
				if (playTimer > 30000) min2 = 75;
				if (playTimer > 30300) min2 = 70;
				if (playTimer > 30600) min2 = 65;
				if (playTimer > 30900) min2 = 60;
				if (playTimer > 31000) min2 = 55;
				//END OF WAVE 6
				if (playTimer > 32000) min2 = 10;
				//FINAL WAVE. PLAY TILL YOU LOSE.
				countdownTimerCone = Math.random() * 15 + min2;
			}
		}


		override public function onEnd(): void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			BGMusic.stop();
		}





	} // end class
} // end package