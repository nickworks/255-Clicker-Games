package dagd.petzak {

	public class SwordFish extends BadFish {

		private var rotating: Boolean = false;
		private var rotated: Boolean = false;
		private var rotateDuration: int = 0;
		private var rotationStartLocation: int = Math.random() * 200 + 300; // 300 to 500

		public function SwordFish() {

			x = -200;
			y = Math.random() * 520 + 90; // 90 to 610
			damage = 20;
		}

		public function update(): void {

			if (rotating && rotate())
				return;

			if (x > rotationStartLocation && !rotated) { // 3. start rotating
				rotating = true;
			} else if (x > rotationStartLocation) { // 4. continue at fast speed after rotation
				x += 4;
			} else if (x > rotationStartLocation - 100) { // 2. slow down before rotation
				gotoAndPlay(1);
				x += 1;
			} else { // 1. start moving at fast speed
				x += 4;
			}

			if (x > 1000) // checks if off right side of screen
				isDead = true;
		}

		public function rotate(): Boolean {

			// move the swordfish in a diamond shape while rotating it 360 degrees - over a span of 40 frames
			if (rotateDuration < 10) {
				x += 8;
				y -= 8;
			} else if (rotateDuration < 20) {
				x -= 8;
				y -= 8;
			} else if (rotateDuration < 30) {
				x -= 8;
				y += 8;
			} else if (rotateDuration < 40) {
				x += 8;
				y += 8;
			} else {
				rotating = false;
				rotated = true;
				x = rotationStartLocation + 1;
				return false; // return false once rotation is done
			}
			rotateDuration++;
			rotation -= 9;
			return true; // continue with rotation
		}
	}
}