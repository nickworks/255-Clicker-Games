package dagd.myles {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class BlackHole extends MovieClip {

		public var isDead: Boolean = false;
		
		public var points:Number = 0;

		public function BlackHole() {
			// constructor code
			x = 800;
			y = Math.random() * 700;

			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		}
		//this function's job is to perform any cleanup 
		//before an object is removed from the games.
		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		}
		// this function should run every game tick.
		// it dictates the behavior of an object.
		public function update(): void {
			
			x-= 1;
			
			if (x < 0) { // checks if off right side of screen
				isDead = true;
				

			}
			


		} // ends update()

		private function mouseOver(e: MouseEvent): void {
			isDead = true;
			//points = 20;
		}

	} // ends BlackHole class

} // ends package