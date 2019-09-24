package dagd.petzak {

	import flash.events.MouseEvent;

	public class GreenFish extends GoodFish {

		var counter: int = Math.random() * 20 + 20;
		var leftNudge: int = 0;
		var goingUp: Boolean = Math.random() * 2 > 1 ? true : false;

		public function GreenFish() {
			x = 900;
			y = Math.random() * 50 + 300;
			points = 30;
			speed = 10;
			nudge = Math.random() * 50 + 10;
		}

		public function update(): void {

			if (doneMovingLeft() && !changingDirection())
				moveUpOrDown();

			if (x < -100) // checks if off left side of screen
				isDead = true;
		}

		// 1. move left for 30 to 60 frames
		private function doneMovingLeft(): Boolean {

			if (counter >= 0) {
				counter--;
				x -= speed;
				return false;
			}
			return true;
		}

		// 2. start moving up or down
		private function moveUpOrDown(): void {

			nudge--;
			if (goingUp) {
				if (y < 90 || nudge == 0) { // 3. switch direction
					goingUp = false;
					leftNudge = 15;
					nudge = Math.random() * 50 + 10;
				}
				rotation = 90;
				y -= speed;
			} else {
				if (y > 600 || nudge == 0) { // 3. switch direction
					goingUp = true;
					leftNudge = 15;
					nudge = Math.random() * 50 + 10;
				}
				rotation = -90;
				y += speed;
			}
		}

		// 4. move left for 15 frames while turning 180 degrees, then go back to step 2
		private function changingDirection(): Boolean {
			if (leftNudge > 0) {
				rotation += !goingUp ? -12 : 12;
				x -= speed;
				leftNudge--;
				return true;
			}
			return false;
		}
	}
}