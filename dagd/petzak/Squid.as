package dagd.petzak {

	public class Squid extends BadFish {

		private var rotationCounter: int = -1;
		private var rotationStart: int = Math.random() * 150 + 100;
		public var shootInk: Boolean = false;
		public var inkShot: Boolean = false;

		public function Squid() {

			x = -250;
			y = Math.random() * 470 + 160;
			damage = 20;
		}

		public function update(): void {

			if (doneMovingRight() && doneRotating90Degrees())
				shootInkAndMoveUpward();
			if (y < -100) // checks if off screen
				isDead = true;
		}

		// 1. move squid to right for 100 to 250 frames
		private function doneMovingRight(): Boolean { 
			rotationStart--;
			if (rotationStart > 0) {
				x += 3;
				frameCounter++;
				if (frameCounter > 10) { // switch frame every 10 frames
					frameToggle = !frameToggle;
					frameCounter = 0;
				}
				gotoAndPlay(frameToggle ? 1 : 4); // display the frame
				return false;
			}
			return true;
		}

		// 2. rotate squid 90 degrees CCW, while moving north east
		private function doneRotating90Degrees(): Boolean { 
			rotationCounter++;
			if (rotationCounter < 180) {
				rotation -= .5;
				x += 1.5;
				y -= 1;
				gotoAndPlay(2);
			} else {
				return true;
			}
			return false
		}

		// 3. shoot ink and rocket upward
		private function shootInkAndMoveUpward(): void {
			if (!inkShot) {
				inkShot = true;
				shootInk = true;
			} else {
				shootInk = false;
			}
			gotoAndPlay(3);
			y -= 6;
		}
	}
}