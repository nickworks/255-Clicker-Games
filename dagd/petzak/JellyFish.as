package dagd.petzak {

	public class JellyFish extends BadFish {

		public var phase: int = 0;

		public function JellyFish() {
			x = Math.random() * 700 - 150; // -150 to 550
			y = 700;
			speed = 3;
			damage = 5  ;
		}

		public function update(): void {
			phase++;
			if (phase < 30) { // move up quickly for 30
				y -= Math.random() * 5;
			} else if (phase < 70) { // slow down and move to the right for 40
				y-= -1;
				x += Math.random() * 2;

			} else if (phase < 110) { // move up slowly for 40
				y -= 1;
			}
			else { // restart cycle
				phase = 0;
			}

			if (y < 0 || x > 1000) { // checks if off screen
				isDead = true;
			}
		} 
	}
}