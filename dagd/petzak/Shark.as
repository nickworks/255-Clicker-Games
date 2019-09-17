package dagd.petzak {

	public class Shark extends BadFish {

		public function Shark() {
			x = -400;
			y = Math.random() * 400 + 160;
			speed = 5;
			damage = 30;
		}

		public function update(): void {
			x += speed; // move to the right three pixels

			if (x > 1000) { // checks if off right side of screen
				isDead = true;
			}
		} // ends update	
	}
}