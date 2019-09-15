package dagd.petzak {

	import flash.events.MouseEvent;

	public class BlueFish extends GoodFish {

		public function BlueFish() {
			x = 900;
			y = Math.random() * 560 + 80;
			points = 20;
			speed = 3;
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
			addEventListener(MouseEvent.MOUSE_OUT, handleOut);
		}

		public override function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_OVER, handleOver);
			removeEventListener(MouseEvent.MOUSE_OUT, handleOut);
		}

		public function update(): void {

			x -= speed; // move to the left

			if (x < -100) { // checks if off left side of screen
				isDead = true;
			}
		}	

		private function handleOver(e: MouseEvent): void {
			speed = 11; // increase speed when hovering over
		}

		private function handleOut(e: MouseEvent): void {
			speed = 3; // return to normal speed
		}
	}
}