package dagd.petzak {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class BadFish extends MovieClip {

		public var isDead: Boolean = false;
		public var touched: Boolean = false;
		public var nudge: int = 0;
		public var speed: int = 0;
		public var damage: int = 0;

		public function BadFish() {
			addEventListener(MouseEvent.MOUSE_OVER, handleOver);
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_OVER, handleOver);
		}

		private function handleOver(e: MouseEvent): void {
			touched = true;
		}
	}
}