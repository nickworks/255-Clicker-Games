package dagd.myles {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class BlueStar extends MovieClip {

		public var isDead: Boolean = false;
		
		public var points:Number = 0;

		public function BlueStar() {
			// constructor code
			x = Math.random() * 800;
			y = Math.random() * 700;

			addEventListener(MouseEvent.CLICK, handleClick);
		}
		//this function's job is to perform any cleanup 
		//before an object is removed from the games.
		public function dispose(): void {
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
		// this function should run every game tick.
		// it dictates the behavior of an object.
		public function update(): void {
			
			x += 2; // move to the right 1 pixel
			
			if (x > 800) { // checks if off right side of screen
				isDead = true;
				

			}
			


		} // ends update()

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			points = 10;
		}

	} // ends BlueStar class

} // ends package