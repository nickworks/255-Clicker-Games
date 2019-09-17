package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Katana extends MovieClip {

		private var velocityY: Number = 0; //Y velocity

		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		public function Katana() {
			// constructor code
			x = (Math.random() * 700) + 50;
			y = -80;

			velocityY = (Math.random() * -3) - 5; //Makes object shoot up at velocity between 30 and 35

			addEventListener(MouseEvent.MOUSE_DOWN, handleHover);
		}

		public function update() {

			var gravity: Number = 0.2;

			velocityY += gravity;

			y += velocityY;

			if (y > 800) isDead = true;
		}

		private function handleHover(e: MouseEvent) {
			isDead = true; //kill this object
			damage = 25; //damage the player
		}

		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleHover);
		}
	}
}