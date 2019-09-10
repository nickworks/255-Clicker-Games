package dagd.wynalda {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Blob extends MovieClip {
		
		public var isDead:Boolean = false;


		public function Blob() {
			x = Math.random() * 800;
			y = Math.random() * 0;
			
			addEventListener(MouseEvent.CLICK, handleClick);

		}
		public function dispose():void{ // this functions job is to perform any cleanup before the object is removed from the game.
			removeEventListener(MouseEvent.CLICK, handleClick);
			
		}

		//This function should run every game tick.
		// It dictates the behavior of a Blob object.
		public function update(): void {
			
			y += 3; // move to right 3 pixels

			if (y < 0) { // checks if off right side of screen
				isDead = true;
				//x = -150; // moves to left side of screen when it goes off right
			}
		} // public function update
		
		private function handleClick(e: MouseEvent):void {
			isDead = true;
		}
		
		
	} // public class Blob
} // package code