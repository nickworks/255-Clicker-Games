package dagd.petzak {

	public class Squid extends BadFish {

		private var rotationCounter: int = -1;
		private var rotationStart: int = Math.random() * 150 + 50;
		public var shootInk: Boolean = false;
		public var inkShot: Boolean = false;

		public function Squid() {

			x = -250;
			y = Math.random() * 450 + 160;
			damage = 20;
		}

		public function update(): void {

			rotationStart--;
			if (rotationStart > 0) { // move to right for 50 to 200 frames
				x += 3;
			}
			else { // start rotation
				rotationCounter++;
				if (rotationCounter < 180) { // rotate 90 degrees CCW
					rotation -= .5;
					x += 2;
					y -= 1;
				}
				else { // shoot ink and speed up
					if (!inkShot) {
						inkShot = true;
						shootInk = true;
					}
					else {
						shootInk = false;
					}
					y -= 4;
				}
			}

			if (y < 0) { // checks if off screen
				isDead = true;
			}
		}
	}
}