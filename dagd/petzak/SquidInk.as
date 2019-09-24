package dagd.petzak {

	import flash.display.MovieClip;

	public class SquidInk extends BadFish {

		private var momentum: int;
		private var vertSpeed: Number;

		public function SquidInk(xLoc: int, yLoc: int, m: int) {
			x = xLoc + Math.random() * 60 - 30;
			y = yLoc + Math.random() * 10 + 100;
			momentum = m;
			vertSpeed = Math.random() * 3;
			speed = Math.random() * 8 - 4; // -4 to 4
			damage = 10;
		}

		public function update(): void {
			
			if (doneMoving())
				fadeAway();
		}

		private function doneMoving(): Boolean {
			momentum--;
			if (momentum > 0) { // keep moving for 40 to 80 frames
				x += speed;
				y += vertSpeed;
				return false;
			}
			return true;
		}

		private function fadeAway(): void {
			if (alpha > 0)
				alpha -= .1;
			else
				isDead = true;
		}
	}
}