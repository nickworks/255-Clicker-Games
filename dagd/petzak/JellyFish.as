package dagd.petzak {

	public class JellyFish extends BadFish {

		public var counter: int = 0;

		public function JellyFish() {
			x = Math.random() * 700 - 150; // -150 to 550
			y = 700;
			speed = 3;
			damage = 15;
		}

		public function update(): void {
			
			counter++;

			if (counter < 30) { // move up quickly for 30
				y -= Math.random() * 5;
				gotoAndPlay(3);
			} else {
				if (counter < 70) { // slow down and move to the right for 40
					y -= -1;
					x += Math.random() * 2;
				} else if (counter < 110) { // move up slowly for 40
					y -= 1;
				} else { // restart cycle
					counter = 0;
				}
				switchFrame();
			}

			if (y < 0 || x > 1000) // checks if off screen
				isDead = true;
		}

		private function switchFrame(): void { // every 10 seconds
			frameCounter++;
			if (frameCounter > 10) {
				frameToggle = !frameToggle;
				frameCounter = 0;
			}
			gotoAndPlay(frameToggle ? 1 : 2);
		}
	}
}