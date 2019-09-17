package dagd.takens {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Fuel extends MovieClip {
		
		public var velocityY: Number;
		public var angularVelocity:int;
		public var isDead: Boolean = false;
		public var wasClicked = false;

		public function Fuel() {
			velocityY = 3;
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			rotation = Math.random() * 360;
			angularVelocity = Math.random() * 10 -5;
		}

		public function update(): void {
			y += velocityY;
			rotation += angularVelocity;
			
			velocityY += .1;
			if (velocityY > 20)
			velocityY = 20;
			if(y > 720){
				isDead = true;
			}
			
			
		}

		private function handleClick(e: MouseEvent): void {
			//damage player;
			isDead = true;
			wasClicked = true;
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
	
}
