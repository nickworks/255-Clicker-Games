package dagd.wynalda {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Snowmobile extends MovieClip {

		public var isDead: Boolean = false;
		public var points: Number = 0;


		public function Snowmobile() {
			x = Math.random() * -150;
			y = Math.random() * 680;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick); // can change from MOUSE_DOWN to ROLL_OVER to change it from having to be clicked to just rolling mouse over it

		}
		public function dispose(): void { // this functions job is to perform any cleanup before the object is removed from the game.
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);

		}

		//This function should run every game tick.
		// It dictates the behavior of a Blob object.
		public function update(): void {

			x += 5; // move to right 3 pixels

			if (x > 810) { // checks if off right side of screen
				isDead = true;
				//x = -150; // moves to left side of screen when it goes off right
			}
		} // public function update

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			points = 5;
			var hurt2 = new Hurt2();
			hurt2.play();
		}


	} // public class Blob
} // package code