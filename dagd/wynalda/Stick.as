package dagd.wynalda {

	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import dagd.wynalda.GameWynalda;
	import dagd.wynalda.MyHUD;


	public class Stick extends MovieClip {

		public var isDead: Boolean = false;
		//public var scoreboard: Number = 0;


		public function Stick() {
			x = Math.random() * 780;
			y = Math.random() * 0;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);

		}
		public function dispose(): void { // this functions job is to perform any cleanup before the object is removed from the game.
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);

		}

		//This function should run every game tick.
		// It dictates the behavior of a Blob object.
		public function update(): void {

			y += 1.2; // move to right 3 pixels

			if (y > 720) { // checks if off right side of screen
				isDead = true;
				//x = -150; // moves to left side of screen when it goes off right
			}
		} // public function update

		private function handleClick(e: MouseEvent): void {
			isDead = true;

		}


	} // public class Blob
} // package code