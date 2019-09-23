package dagd.myles {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.utils.Timer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;

	public class GameMyles extends Game {

		private var stars: Array = new Array(); // make an empty array
		private var blackholes: Array = new Array();
		private var bluestars: Array = new Array();
		private var redstars: Array = new Array();
		private var asteroids: Array = new Array();
		private var supernovas: Array = new Array();
		private var countdownTimer: int = 60;
		private var playTimer: int = 0;
		private var health: Number = 8;
		private var score: Number = 0;
		private var gameTime: Number = 0;
		private var xAtFullHealth: Number;
		private var hud: dagd.myles.MyHUD;
		private var objectTimer: Number = 600;

		//hud.healthbar.scaleX = health/15;


		public function GameMyles() {

			creatorName = "Danny Myles";
			gameTitle = "Shooting Stars";

		}

		override public function onStart(): void {

			hud = new dagd.myles.MyHUD();
			addChild(hud);
			xAtFullHealth = hud.healthbar.x;
			hud.scoreboard.autoSize = TextFieldAutoSize.RIGHT;
			hud.timer.autoSize = TextFieldAutoSize.LEFT;

			addEventListener(Event.ENTER_FRAME, gameLoop);
			
			graphics.beginFill(0x000033);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.endFill();
		}

		override public function onEnd(): void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);

		}

		private function gameLoop(e: Event): void {
			
			


			if (App.main.isPaused) return;



			if (health <= 0) {
				App.main.isPaused = true;
				removeEventListener(Event.ENTER_FRAME, gameLoop);
			}


			playTimer++;



			countdownTimer--;

			if (countdownTimer <= 0) {
				spawnStar();
				spawnAsteroid();

				gameTime += 1;


				//var min: int = 120;
				//if (playTimer > 300) min = 15;
				//if (playTimer > 600) min = 0;

				countdownTimer = 60 //+ min; // range of (min) to (min+120) frames


			}

			objectTimer--;

			if (objectTimer <= 0) {
				spawnRedStar();
				objectTimer = 600;
			}
			if (objectTimer == 300) {
				spawnBlueStar();
			}
			if (objectTimer == 540) {

			}
			if (objectTimer == 300) {
				spawnBlackHole();
			}
			if (objectTimer == 500) {
				spawnSupernova();
			}



			hud.healthbar.scaleX = health / 8;
			
			if (health >= 8) {
				health = 8;
			}

			hud.scoreboard.text = "Score: " + score;
			hud.timer.text = "Time: " + gameTime;


			updateStar();
			updateBlackHole();
			updateBlueStar();
			updateRedStar();
			updateAsteroid();
			updateSupernova();






		} // ends gameLoop

		private function spawnStar(): void {
			var s = new Star(); // spawning a star
			stars.push(s); // adding it to the collection (array)
			addChild(s); // adding it to the graph (so that it renders)
		}
		private function spawnBlackHole(): void {
			var b = new BlackHole();
			blackholes.push(b);
			addChild(b);
		}
		private function spawnBlueStar(): void {
			var bs = new BlueStar();
			bluestars.push(bs);
			addChild(bs);
		}
		private function spawnRedStar(): void {
			var rs = new RedStar();
			redstars.push(rs);
			addChild(rs);
		}
		private function spawnAsteroid(): void {
			var a = new Asteroid();
			asteroids.push(a);
			addChild(a);
		}
		private function spawnSupernova(): void {
			var sn = new Supernova();
			supernovas.push(sn);
			addChild(sn);
		}


		private function updateStar(): void {
			for (var i: int = 0; i < stars.length; i++) {
				stars[i].update();
				if (stars[i].isDead === true) {

					if (stars[i].isDead) {

						if (stars[i].points > 0) {
							score += stars[i].points;
							//trace("score: " + score);
						}
					}
					// 1. remove from scene graph 
					removeChild(stars[i]);

					// 2. remove even-listeners
					stars[i].dispose();

					// 3. deref variables
					stars.splice(i, 1); // removing #i from array
				}
			}

		}
		private function updateBlackHole(): void {
			for (var i: int = 0; i < blackholes.length; i++) {
				blackholes[i].update();
				if (blackholes[i].isDead === true) {

					if (blackholes[i].isDead) {

						if (blackholes[i].health > 0) {
							health -= blackholes[i].health;
							//trace(health);
						}
					}

					removeChild(blackholes[i]);

					blackholes[i].dispose();

					blackholes.splice(i, 1);
				}
			}
		}
		private function updateBlueStar(): void {
			for (var i: int = 0; i < bluestars.length; i++) {
				bluestars[i].update();
				if (bluestars[i].isDead === true) {

					if (bluestars[i].isDead) {

						if (bluestars[i].points > 0) {
							score += bluestars[i].points;
							//trace("(+1 health) score: " + score);
						}

						if (bluestars[i].health > 0) {
							health += bluestars[i].health;

						}
					}
					removeChild(bluestars[i]);
					bluestars[i].dispose();
					bluestars.splice(i, 1);
				}
			}

		}
		private function updateRedStar(): void {
			for (var i: int = 0; i < redstars.length; i++) {
				redstars[i].update();
				if (redstars[i].isDead === true) {

					if (redstars[i].isDead) {

						if (redstars[i].points > 0) {
							score += redstars[i].points;
							//trace("score: " + score);
						}
					}
					removeChild(redstars[i]);
					redstars[i].dispose();
					redstars.splice(i, 1);
				}
			}

		}
		private function updateAsteroid(): void {
			for (var i: int = 0; i < asteroids.length; i++) {
				asteroids[i].update();
				if (asteroids[i].isDead === true) {

					if (asteroids[i].isDead) {

						if (asteroids[i].health > 0) {
							health -= asteroids[i].health;
							//trace(health);
						}
					}

					removeChild(asteroids[i]);

					asteroids[i].dispose();

					asteroids.splice(i, 1);
				}
            }
			
		}	
		private function updateSupernova(): void {
			for (var i: int = 0; i < supernovas.length; i++) {
				supernovas[i].update();
				if (supernovas[i].isDead === true) {

					if (supernovas[i].isDead) {

						if (supernovas[i].health > 0) {
							health -= supernovas[i].health;
							//trace(health);
						}
					}

					removeChild(supernovas[i]);

					supernovas[i].dispose();

					supernovas.splice(i, 1);
				}
			}
		}


	}
} // ends package