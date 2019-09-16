package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Heart extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		public function Heart() {
			// constructor code
			x = (Math.random() * 700) + 50;
			y = 730;

			velocityX = Math.random() * 5 - 2.5; // -2.5 to +2.5
			velocityY = (Math.random() * -6) - 10; //Makes object shoot up at velocity between 30 and 35
			velocityA = (Math.random() * 2) - 1; //Velocity for the rotation of the object

			addEventListener(MouseEvent.CLICK, handleClick);
		}

		public function update() {

			var gravity: Number = 0.3;

			velocityY += gravity;

			x += velocityX;
			y += velocityY;
			
			rotation += velocityA;

			if (y > 760) isDead = true;
		}

		private function handleClick(e: MouseEvent) {
			isDead = true; //kill this object
			points = 100; //give the player points
			damage = -20; //damage the player
		}

		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
	}
}