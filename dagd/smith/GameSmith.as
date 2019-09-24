package dagd.smith {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;

	public class GameSmith extends Game {

		private var stars: Array = new Array(); // array to hold stars
		private var meteors: Array = new Array(); // array to hold meteors
		private var planets: Array = new Array(); // array to hold planets
		private var blackholes: Array = new Array(); // array to hold black holes
		private var suns: Array = new Array(); // array to hold suns
		private var aliens: Array = new Array(); // array to hold aliens

		private var countdownTimer: int = 0;
		private var countdownTimer2: int = 0;

		private var playTimer: int = 0; // Times how long game is played

		private var hud: HUD;

		private var health: Number = 100;
		private var score: Number = 0;
		private var xAtFullHealth: Number;

		var i: int;


		public function GameSmith() {
			creatorName = "Antonio Smith";
			gameTitle = "Star Chaser";
		}

		override public function onStart(): void { // nothing happens until my game specifically is started			
			hud = new HUD();
			addChild(hud);
			//xAtFullHealth = hud.healthBar.x;
			//hud.scoreboard.autoSize = TextFieldAutoSize.RIGHT;

			addEventListener(Event.ENTER_FRAME, gameLoop);
		}

		override public function onEnd(): void { // Prevents Data Leaks after ending game
			removeEventListener(Event.ENTER_FRAME, gameLoop); // Need one of these for every function
		}

		private function gameLoop(e: Event): void {

			if (App.main.isPaused) return;

			playTimer++;

			countdownTimer--;
			if (countdownTimer <= 0) {
				spawnStar();
				spawnPlanet();
				spawnSun();

				var minsafe: int = 30;
				if (playTimer > 300) minsafe = 15; // As the game goes on stars will spawn faster
				if (playTimer > 600) minsafe = 0;
				countdownTimer = Math.random() * 30 + minsafe;
			}
			countdownTimer2--;
			if (countdownTimer2 <= 0) {
				spawnMeteor();
				spawnBlackHole();
				spawnAlien();

				var minhurty: int = 60;
				if (playTimer > 300) minhurty = 60; // As the game goes on meteors will spawn faster
				if (playTimer > 600) minhurty = 0;
				countdownTimer2 = Math.random() * 100 + minhurty;
			}
			if (App.main.isPaused) {
				return;
			}

			for (i = 0; i < stars.length; i++) {
				stars[i].update();
				if (stars[i].isDead == true) {
					removeChild(stars[i]);
					stars[i].cleanup();
					stars.splice(i, 1);
				}
			}

			for (i = 0; i < planets.length; i++) {
				planets[i].update();
				if (planets[i].isDead == true) {
					removeChild(planets[i]);
					planets[i].cleanup();
					planets.splice(i, 1);
				}
			}

			for (i = 0; i < suns.length; i++) {
				suns[i].update();
				if (suns[i].isDead == true) {
					removeChild(suns[i]);
					suns[i].cleanup();
					suns.splice(i, 1);
				}
			}

			for (i = 0; i < meteors.length; i++) {
				meteors[i].update();
				if (meteors[i].isDead == true) {
					removeChild(meteors[i]);
					meteors[i].cleanup();
					meteors.splice(i, 1);
				}
			}

			for (i = 0; i < blackholes.length; i++) {
				blackholes[i].update();
				if (blackholes[i].isDead == true) {
					removeChild(blackholes[i]);
					blackholes[i].cleanup();
					blackholes.splice(i, 1);
				}
			}
			
			for (i = 0; i < aliens.length; i++) {
				aliens[i].update();
				if (aliens[i].isDead == true) {
					removeChild(aliens[i]);
					aliens[i].cleanup();
					aliens.splice(i, 1);
				}
			}
		} // end gameLoop

		private function spawnStar(): void {
			var s = new Star();
			stars.push(s);
			addChild(s);
		}

		private function spawnMeteor(): void {
			var m = new Meteor();
			meteors.push(m);
			addChild(m);
		}

		private function spawnPlanet(): void {
			var p = new Planet();
			planets.push(p);
			addChild(p);
		}

		private function spawnBlackHole(): void {
			var b = new BlackHole();
			blackholes.push(b);
			addChild(b);
		}

		private function spawnSun(): void {
			var S = new Sun();
			suns.push(S);
			addChild(S);
		}

		private function spawnAlien(): void {
			var a = new Alien();
			aliens.push(a);
			addChild(a);
		}
	}
}