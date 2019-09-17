package dagd.takens {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Rocket extends MovieClip {
		
		
		public var velocityX: int;
		public var velocityY: Number;
		public var isOnRight:Boolean = false;
		public var isDead: Boolean = false;
		public var wasHit = false;

		public function Rocket() {
			addEventListener(MouseEvent.ROLL_OVER, handleClick);
			velocityY = -15;
			//angularVelocity = Math.random() * 10 -5;
		}

		public function update(): void {
			rotation = (Math.atan2(velocityY, velocityX)/Math.PI *180) + 90;
			x += velocityX;
			y += velocityY;
			
			velocityY += .3;
			if (velocityY > 20)
				velocityY = 20;
			if(y > 730){
				isDead = true;
			}
			
			
		}

		private function handleClick(e: MouseEvent): void {
			//damage player;
			isDead = true;
			wasHit = true;
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
	}
	
}
