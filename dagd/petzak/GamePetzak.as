package dagd.petzak {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.text.TextField;
	import com.adobe.tvsdk.mediacore.utils.SWFTokenDataLoader;

	public class GamePetzak extends Game {

		/*  
			Key game mechanics:
			
			Friendly or hurty fish will spawn every 20 to 70 frames
			Spawn rate increases every 30 seconds (max frames to spawn reduced by 2), rate caps at 750 seconds
			Clicking a friendly fish gives points
			Touching a hurty fish does damage
			Goldfish clicks increase the score multiplier by 1
			Score multipler is reduced by 1 whenever damage is dealt					
			Player has 300 health (width of healthbar)
			Game stops once health reaches zero, restarts with a click
		
			Behavior:
		
			20 points - Bluefish - Speeds up when touched 
			30 points - Rainbowfish - Releases a group of 7 minifish when clicked
			10 points - Minifish - Dispersed from rainbowfish, each with somewhat random speed/location
			100 points- Goldfish - Shifts up and down while moving left
			10 damage  - Jellyfish - Bounces up and down while slowly moving right
			20 damage - Swordfish - Slows down, does a spin, then speeds up
			20 damage - Squid - Moves right, rotates 90 degrees, then shoots ink and rockets upward
			10 damage - Ink - Shot from squid and dispersed somewhat randomly
			30 damage - Shark - Eats oncoming friendly fish 
		*/

		private var goodFish: Array = new Array();
		private var badFish: Array = new Array();
		private var spawnTimer: int = 1;
		private var spawnMultiplier: Number = 50;
		private var hud: HUD = new HUD();
		private var score: int = 0;
		private var multiplier: Number = 1;
		private var time: int = 0;
		private var frames = 0;
		private var gameOver = false;

		public function GamePetzak() {
			gameTitle = "Fishy Clicks";
		}

		public override function onStart(): void {
			creatorName = "Alec Petzak";
			addEventListener(Event.ENTER_FRAME, gameLoop);
			addChild(new Background());
			addChild(hud);
		}

		public override function onEnd(): void {
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			resetObjects();
		}

		private function gameLoop(e: Event): void {
			if (dagd.core.App.main.isPaused || gameOver) {
				return;
			}

			// track the passage of time
			updateTime();
			spawnTimer--;

			// spawn new game objects
			if (spawnTimer == 0) {
				addNewObject();
				spawnTimer = Math.floor(Math.random() * spawnMultiplier) + 20;
			}

			// render all game objects
			updateGoodFish();
			updateBadFish();
		}

		private function updateTime(): void {
			frames++;
			if (frames / 60 == Math.floor(frames / 60)) { // every second
				time++;
				hud.timeboard.text = "Time: " + time; // increment time

				if (time / 30 == Math.floor(time / 30) && spawnMultiplier > 20) { // every 30 seconds
					spawnMultiplier -= 2; // slightly increase spawn rate
				}
			}
		}

		private function addNewObject(): void {
			var rand: Number = Math.random() * 100; // 0 to 100

			// randomly pick an object to spawn

			if (rand < 40) {
				spawn(new BlueFish()); // 40% chance
			} else if (rand < 48) {
				spawn(new GoldFish()) // 8% chance
			} else if (rand < 67) {
				spawn(new RainbowFish()); // 19% chance
			} else if (rand < 74) {
				spawnBad(new Squid()); // 7% chance
			} else if (rand < 81) {
				spawnBad(new SwordFish()); // 7% chance
			} else if (rand < 93) {
				spawnBad(new JellyFish()) // 12% chance
			} else {
				spawnBad(new Shark()) // 7% chance
			}

			setChildIndex(hud, numChildren - 1); // move hud to front 
		}

		private function updateGoodFish(): void {
			for (var i: int = goodFish.length - 1; i >= 0; i--) {
				goodFish[i].update();

				if (goodFish[i].isDead) {
					if (goodFish[i].isClicked) {
						if (goodFish[i].toString() == "[object GoldFish]") { // increase multiplier if goldfish
							multiplier++;
							hud.multiboard.text = "Multiplier: " + multiplier;
						}

						score += goodFish[i].points * multiplier; // increase score
						hud.scoreboard.text = "Score: " + score;
					}

					if (goodFish[i].toString() == "[object RainbowFish]") {
						var child: Object = getChildAt(getChildIndex(goodFish[i])); // get rainbow fish
						spawnMiniFish(child.x, child.y); // spawn mini fish at the rainbow fish location
					}

					if (goodFish[i].toString() == "[object BlueFish]") {
						goodFish[i].disposeBlue();
					} else {
						goodFish[i].dispose(); // remove event listeners
					}
					removeChild(goodFish[i]); // remove from scene graph
					goodFish.removeAt(i); // remove from the array
				}
			}
		}

		private function updateBadFish(): void {
			for (var i: int = badFish.length - 1; i >= 0; i--) {
				badFish[i].update();

				if (badFish[i].touched) { // if mouse touched bad fish
					hud.healthBar.width -= badFish[i].damage; // lower health
					if (multiplier > 1) {
						multiplier--;
						hud.multiboard.text = "Multiplier: " + multiplier;
					}
					if (hud.healthBar.width <= badFish[i].damage) { // if health is zero
						stopGame();
					}
					badFish[i].touched = false;
				}

				if (badFish[i].toString() == "[object Shark]") {
					eatFish(getChildAt(getChildIndex(badFish[i])));
				}
				
				if (badFish[i].toString() == "[object Squid]" && badFish[i].shootInk) {
					shootInk(getChildAt(getChildIndex(badFish[i])));
				}

				if (badFish[i].isDead) {
					badFish[i].dispose(); // remove event listeners
					removeChild(badFish[i]); // remove from scene graph
					badFish.removeAt(i); // remove from the array
				}
			}
		}

		private function spawn(mc: MovieClip): void {
			addChild(mc); // add fish to scene graph		
			goodFish.push(mc); // add fish to collection
		}

		private function spawnBad(mc: MovieClip): void {
			addChild(mc); // add fish to scene graph		
			badFish.push(mc); // add fish to collection
		}

		private function spawnMiniFish(xloc: int, yloc: int): void {
			// spawn 7 mini fish at location of rainbowfish
			for (var i: int = 0; i < 7; i++) {
				spawn(new MiniFish(xloc, yloc, i));
			}
		}

		private function eatFish(shark: Object): void {
			// kill any fish that are near the sharks mouth
			for (var i: int = goodFish.length - 1; i >= 0; i--) {
				var fish: Object = getChildAt(getChildIndex(goodFish[i])); // get fish				
				if (Math.abs(shark.x + 350 - fish.x) < 5 && Math.abs(shark.y - fish.y) < 35) {
					goodFish[i].dispose(); // remove event listeners
					removeChild(goodFish[i]); // remove from scene graph
					goodFish.removeAt(i); // remove from the array
				}
			}
		}

		private function shootInk(squid: Object): void {
			var momentum: int = Math.random() * 40 + 40;
			for (var j: int = 10; j >= 0; j--) {
				spawnBad(new SquidInk(squid.x, squid.y, momentum));
			}
		}
		
		private function stopGame(): void {
			hud.healthBar.width = 0;
			gameOver = true;
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			addGameOverText();
		}

		private function addGameOverText(): void {
			var tf: TextField = new TextField();
			tf.text = "Game Over - Click to restart";
			tf.width = 200;
			tf.selectable = false;
			tf.x = 300;
			tf.y = 300;
			addChildAt(tf, numChildren - 1);
		}

		private function mouseDown(e: MouseEvent): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			restartGame();
		}

		private function restartGame(): void {
			// reset to initial state
			resetObjects();
			spawnTimer = 1;
			spawnMultiplier = 50;
			score = 0;
			multiplier = 1;
			time = 0;
			frames = 0;
			gameOver = false;
			hud = new HUD();
			while (numChildren > 0) {
				removeChildAt(0); // remove all children
			}
			addChild(hud);
			addChild(new Background());
		}

		private function resetObjects(): void {
			// not sure if we need to dispose before clearing the arrays, but just to be safe
			for (var i: int = goodFish.length - 1; i >= 0; i--) {
				goodFish[i].dispose();
			}
			for (var j: int = badFish.length - 1; j >= 0; j--) {
				badFish[j].dispose();
			}
			goodFish = new Array();
			badFish = new Array();
		}
	} // end GamePetzak
} // end package