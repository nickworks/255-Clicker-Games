package dagd.takens {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Cow extends MovieClip {

		public var velocityX: int;
		public var velocityY: int;
		public var isDead: Boolean = false;

		public function Cow() {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function update(): void {
			x += velocityX;
			y += velocityY;
			if(x < -20 || x > 810 || y < -10 || y > 720){
				isDead = true;
			}
		}

		private function handleClick(e: MouseEvent): void {
			isDead = true;
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

	}
}