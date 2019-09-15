package dagd.petzak {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class GoodFish extends MovieClip {

		public var isDead: Boolean = false;
		public var isClicked: Boolean = false;
		public var nudge: int = 0;
		public var speed: int = 0;
		public var points = 0;

		public function GoodFish() {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			//trace("dispose");
		}

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			isClicked = true;
		}
	}
}