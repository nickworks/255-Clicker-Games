package dagd.smith {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Star extends MovieClip {

		public var isDead: Boolean = false
		public var isClicked: Boolean = false
		public var points: Number = 0;

		private var velocityA: Number = 0; // angular velocity

		public function Star() {
			x = Math.random() * 550;
			y = Math.random() * 550;

			velocityA = Math.random();

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function cleanup(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function update(): void {
			x += 3;

			rotation += velocityA;

			if (x > 600) {
				isDead = true;
				points = 100;
			}
		}
		private function handleClick(e: MouseEvent): void {
			isDead = true;
			isClicked = true;
		}
	}
}