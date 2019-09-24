package dagd.myles {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Supernova extends MovieClip {

		private var velocityX: Number = 0;
		private var velocityY: Number = 0;
		private var velocityA: Number = 0; // angular velocity

		public var isDead: Boolean = false;
		public var health:Number = 0;

		public function Supernova() {
			x = 800/2;
			y = 500;
			
			velocityX = Math.random() * 20 - 10; // -10 to +10
			velocityY = Math.random() * 10 - 20; // -20 to -10
			velocityA = Math.random() * 80 - 40; // -40 to +40
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		}
		public function dispose():void {
			removeEventListener(MouseEvent.MOUSE_OVER, mouseOver);
		}
	
		public function update():void {
						
			// euler integration:
			
			var gravity:Number = 1;
			
			velocityY += gravity;
			
			x += velocityX;
			y += velocityY;
			
			rotation += velocityA;
			
			if(y > 600) isDead = true; 
		} // ends update
		private function mouseOver(e: MouseEvent): void {
			isDead = true;
			health = 2;
		}

	} // ends Supernova class

} // ends package