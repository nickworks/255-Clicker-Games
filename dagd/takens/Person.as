package dagd.takens {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Person extends MovieClip {
		
		
		public var velocityX: int;
		public var velocityY: int;
		public var isDead: Boolean = false;
		public var wasClicked = false;
		public var ticker:int = 0;

		public function Person() {
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			velocityX = Math.random() * 10 - 5;
			velocityY = Math.random() * 10 - 5;
		}

		public function update(): void {
			ticker--;
			if (ticker <= 0){
			ticker = Math.random() * 100 + 30;
			velocityX = Math.random() * 10 - 5;
				if(velocityX < 1 && velocityX > -1){
					velocityX = 1;
				}
			velocityY = Math.random() * 10 - 5;
				if(velocityY < 1 && velocityY > -1){
					velocityY = 1;
				}
			}
			
			x += velocityX;
			y += velocityY;
			if(x < -20 || x > 810 || y < -10 || y > 720){
				isDead = true;
			}
		}

		private function handleClick(e: MouseEvent): void {
			isDead = true;
			wasClicked = true;
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
	
}
