package dagd.myles {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class RedStar extends MovieClip {

		public var isDead: Boolean = false;
		
		public var points:Number = 0;

		public function RedStar() {
			// constructor code
			x = Math.random() * 800;
			y = 700;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		//this function's job is to perform any cleanup 
		//before an object is removed from the games.
		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		// this function should run every game tick.
		// it dictates the behavior of an object.
		public function update(): void {
			
			y -= 10; // move to the right 1 pixel
			
			if (y > 700) { // checks if off right side of screen
				isDead = true;
				

			}
			


		} // ends update()

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			points = 20;
		}

	} // ends RedStar class

} // ends package
