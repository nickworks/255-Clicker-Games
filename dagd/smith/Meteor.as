package dagd.smith {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Meteor extends MovieClip {

		public var isDead: Boolean = false
		public var isClicked: Boolean = false

		public function Meteor() {
			x = Math.random() * 550;
			y = Math.random() * 550;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function cleanup(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function update(): void {
			x += 3;

			if (x > 600) {
				isDead = true;
			}
		}

		public function handleClick(e: MouseEvent): void {
			isDead = true;
			isClicked = true;			
		}
	}

}