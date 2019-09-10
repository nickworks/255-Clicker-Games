package dagd.myles {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Star extends MovieClip {

		public var isDead: Boolean = false;

		public function Star() {
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
		// it dictates the behavior of a blob object.
		public function update(): void {
			x += 1; // move to the right 1 pixel
			if (x > 800) { // checks if off right side of screen
				isDead = true;

			}

		} // ends update()

		private function handleClick(e: MouseEvent): void {
			isDead = true;
		}

	} // ends Star class

} // ends package