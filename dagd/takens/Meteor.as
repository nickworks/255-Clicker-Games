package dagd.takens {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Meteor extends MovieClip {
		
		public var velocityX: int;
		public var velocityY: int;
		public var angularVelocity:int;
		public var isDead: Boolean = false;
		public var wasHit = false;

		public function Meteor() {
			scaleX = Math.random() * .4 + .8;
			scaleY = Math.random() * .4 + .8;
			addEventListener(MouseEvent.ROLL_OVER, handleClick);
			velocityX = Math.random() * 10 -5;
			rotation = Math.random() * 360;
			angularVelocity = Math.random() * 10 -5;
		}

		public function update(): void {
			x += velocityX;
			y += velocityY/1.5;
			rotation += angularVelocity;
			
			velocityY += 1;
			if (velocityY > 20)
			velocityY = 20;
			if(y > 720){
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
