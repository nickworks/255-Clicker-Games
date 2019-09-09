package dagd.powers.objects {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class EvilTwo extends MovieClip {

		public var isDead: Boolean = false;

		public function EvilTwo() {
			// constructor code
			x = Math.random() * 550;
			y = Math.random() * 400;

			addEventListener(MouseEvent.CLICK, handleClick);
		}

		public function update() {
			x += 3; //move object

			if (x > 550) { //check if off right side of screen
				//blob.x = 0; //set to left side of screen
				isDead = true;
			}
		}
		
		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.CLICK, handleClick);
		}

		private function handleClick (e:MouseEvent) {
			isDead = true;
		}
	}
}