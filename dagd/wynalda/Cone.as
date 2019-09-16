package dagd.wynalda {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Cone extends MovieClip {

		public var isDead: Boolean = false;
		//PHYSICS
		private var velocityX: Number = 0;
		private var velocityY: Number = 0;
		private var velocityA: Number = 0;
		public var points: Number = 0;
		public var healths: Number;
		//END PHYSICS

		public function Cone() {
			x = Math.random() * 780;
			y = Math.random() * 0;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick); // can change from MOUSE_DOWN to ROLL_OVER to change it from having to be clicked to just rolling mouse over it

		}
		public function dispose(): void { // this functions job is to perform any cleanup before the object is removed from the game.
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);

		}

		//This function should run every game tick.
		// It dictates the behavior of a Blob object.
		public function update(): void {

			y += 1.5; // moves down 1.5 pixels

			if (y > 720) { // checks if off right side of screen
				isDead = true;
				healths = 1;
				//x = -150; // moves to left side of screen when it goes off right
			}
		} // public function update

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			points = 5;
		}


		public function Physics() {
			velocityX = Math.random() * 20 - 10;
			velocityY = Math.random() * 10 - 20;
			velocityA = Math.random() * 50 - 20;
		}

	} // public class Blob
} // package code