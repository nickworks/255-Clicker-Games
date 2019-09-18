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
		30 points - Greenfish - Restores 30 health.
		100 points- Goldfish - Shifts up and down while moving left. Increases multiplier when clicked.
		15 damage  - Jellyfish - Bounces up and down while slowly moving right
		20 damage - Swordfish - Slows down, does a spin, then speeds up
		20 damage - Squid - Moves right, rotates 90 degrees, then shoots ink and rockets upward
		10 damage - Ink - Shot from squid and dispersed somewhat randomly
		20 damage - Piranha - Chases cursor for a few seconds or until it catches the cursor
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
		private var startAnims = false;

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
				stopAnimations();
				return;
			} else if (startAnims) {
				startAnimations();
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

		private function stopAnimations(): void {

			for (var i: int = goodFish.length - 1; i >= 0; i--)
				goodFish[i].stop();
			for (var j: int = badFish.length - 1; j >= 0; j--)
				badFish[j].stop();
			startAnims = true;
		}

		private function startAnimations(): void {

			for (var i: int = goodFish.length - 1; i >= 0; i--)
				goodFish[i].play();
			for (var j: int = badFish.length - 1; j >= 0; j--)
				badFish[j].play();
			startAnims = false;
		}

		private function updateTime(): void {

			frames++;
			if (frames / 60 == Math.floor(frames / 60)) { // every second
				time++;
				hud.timeboard.text = "Time: " + time; // increment time

				if (time / 30 == Math.floor(time / 30) && spawnMultiplier > 20) // every 30 seconds
					spawnMultiplier -= 2; // slightly increase spawn rate
			}
		}

		private function addNewObject(): void {
			// randomly pick an object to spawn
			var rand: Number = Math.random() * 100; // 0 to 100

			if (rand < 35)
				spawn(new BlueFish()); // 35% chance
			else if (rand < 43)
				spawn(new GreenFish()); // 8% chance
			else if (rand < 51)
				spawn(new GoldFish()) // 8% chance
			else if (rand < 66)
				spawn(new RainbowFish()); // 15% chance
			else if (rand < 73)
				spawnBad(new Squid()); // 7% chance
			else if (rand < 80)
				spawnBad(new SwordFish()); // 7% chance
			else if (rand < 87)
				spawnBad(new JellyFish()) // 12% chance
			else if (rand < 93)
				spawnBad(new Piranha()) // 6% chance
			else
				spawnBad(new Shark()) // 7% chance

				setChildIndex(hud, numChildren - 1); // move hud to front 
		}

		private function updateGoodFish(): void {

			for (var i: int = goodFish.length - 1; i >= 0; i--) {

				goodFish[i].update();

				if (goodFish[i].isDead) {

					if (goodFish[i].isClicked) {

						var obj: String = getObjectName(goodFish[i]);

						if (obj == "GoldFish")
							hud.multiboard.text = "Multiplier: " + ++multiplier; // increase multiplier
						else if (obj == "GreenFish")
							restoreHealth();

						score += goodFish[i].points * multiplier; // increase score
						hud.scoreboard.text = "Score: " + score;
					} // end isClicked

					if (obj == "RainbowFish")
						spawnMiniFish(getChildAt(getChildIndex(goodFish[i]))); // spawn mini fish at the rainbow fish location

					if (obj == "BlueFish")
						goodFish[i].disposeBlue();
					else
						goodFish[i].dispose(); // remove event listeners

					removeChild(goodFish[i]); // remove from scene graph
					goodFish.removeAt(i); // remove from the array

				} // end isDead
			} // end loop
		} // end updateGoodFish

		private function updateBadFish(): void {

			for (var i: int = badFish.length - 1; i >= 0; i--) {

				var obj: String = getObjectName(badFish[i]);

				if (obj == "Piranha")
					badFish[i].update(mouseX, mouseY);
				else
					badFish[i].update();

				if (badFish[i].touched) // if cursor touched bad fish					
					dealDamage(badFish[i]);

				if (obj == "Shark")
					eatFish(getChildAt(getChildIndex(badFish[i])));

				if (obj == "Squid" && badFish[i].shootInk)
					shootInk(getChildAt(getChildIndex(badFish[i])));

				if (badFish[i].isDead) {
					badFish[i].dispose(); // remove event listeners
					removeChild(badFish[i]); // remove from scene graph
					badFish.removeAt(i); // remove from the array
				}
			}
		}

		private function restoreHealth(): void {
			hud.healthBar.width += 30;
			if (hud.healthBar.width > 300)
				hud.healthBar.width = 300;
		}

		private function dealDamage(fish: Object): void {

			hud.healthBar.width -= fish.damage; // lower health
			if (multiplier > 1) {
				multiplier--;
				hud.multiboard.text = "Multiplier: " + multiplier;
			}
			if (hud.healthBar.width <= fish.damage) // if health is zero
				stopGame();

			fish.touched = false;
		}

		private function getObjectName(o: Object): String {
			return o.toString().replace("[object ", "").replace("]", "");
		}

		private function spawn(mc: MovieClip): void {
			// add fish to scene graph and collection
			addChild(mc);
			goodFish.push(mc);
		}

		private function spawnBad(mc: MovieClip): void {
			// add fish to scene graph and collection
			addChild(mc);
			badFish.push(mc);
		}

		private function spawnMiniFish(o: Object): void {
			// spawn 7 mini fish at location of rainbowfish
			for (var i: int = 0; i < 7; i++) {
				spawn(new MiniFish(o.x, o.y, i));
			}
		}

		private function eatFish(shark: Object): void {
			// kill any fish that are near the sharks mouth
			for (var i: int = goodFish.length - 1; i >= 0; i--) {
				var fish: Object = getChildAt(getChildIndex(goodFish[i])); // get fish		
				if (Math.abs(shark.x + 150 - fish.x) < 5 && Math.abs(shark.y - fish.y) < 40) {
					shark.gotoAndPlay(30);
					goodFish[i].dispose(); // remove event listeners
					removeChild(goodFish[i]); // remove from scene graph
					goodFish.removeAt(i); // remove from the array
				}
			}
		}

		private function shootInk(squid: Object): void {
			var momentum: int = Math.random() * 40 + 40;
			for (var j: int = 20; j >= 0; j--) {
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
			// create and add game over text field
			var tf: TextField = new TextField();
			tf.text = "Game Over - Click to restart";
			tf.width = 200;
			tf.selectable = false;
			tf.x = 100;
			tf.y = 300;
			tf.scaleX = 4;
			tf.scaleY = 4;
			addChild(tf);
		}

		private function mouseDown(e: MouseEvent): void {

			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			restartGame();
		}

		private function restartGame(): void {
			// reset to initial state
			startAnims = true;
			resetObjects();
			spawnTimer = 1;
			spawnMultiplier = 50;
			multiplier = 1;
			score = time = frames = 0;
			gameOver = false;
			hud = new HUD();
			while (numChildren > 0) {
				removeChildAt(0); // remove all children
			}
			addChild(hud);
			addChild(new Background());
		}

		private function resetObjects(): void {
			// dipose and clear arrays
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