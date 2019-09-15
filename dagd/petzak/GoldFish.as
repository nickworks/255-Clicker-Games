package dagd.petzak {

	public class GoldFish extends GoodFish {

		public function GoldFish() {
			x = 900;
			y = Math.random() * 560 + 80;
			points = 100;
		}

		public function update(): void {
			x -= 12; // move to the left
			randomVerticalShift();
			
			if (x < -50) { // checks if off left side of screen
				isDead = true;
			}
		}
		
		private function randomVerticalShift() {
			if (nudge > 0) { // move up nudge times
				y--;
				nudge--;
			} else if (nudge < 0) { // move down nudge times
				y++;
				nudge++;
			} else {
				nudge = (Math.floor(Math.random() * 100) - 50); // -50 to 50
			}
		}
	}
}