package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Multi extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		var sideTest: Number = 1;

		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		public function Multi() {
			// constructor code
			sideTest = Math.random();

			if (sideTest >= 0.5) x = -50;
			else x = 850;
			y = Math.random() * 300 + 600;

			if (sideTest >= 0.5) velocityX = (Math.random() * 2) + 2; // Makes the spear fly across the screen from left to right
			else velocityX = (Math.random() * -2) - 2; // Makes the spear fly across the screen from right to left

			velocityY = (Math.random() * 0.5) + 0.5; //Makes object shoot slowly fall down

			if (sideTest >= 0.5) velocityA = (Math.random() * 4) - 2; //Velocity for the rotation of the object
			else velocityA = (Math.random() * -4) + 2; //Velocity for the rotation of the object

			addEventListener(MouseEvent.CLICK, handleClick);
		}

		public function update() {

			var gravity: Number = -0.05;

			velocityY += gravity;

			x += velocityX;
			y += velocityY;

			rotation += velocityA;

			if (y < -50) isDead = true; //kill the object
		}

		private function handleClick(e: MouseEvent) {
			isDead = true; //kill this object
			points = 200; //give the player points
			damage = -10; //damage the player
		}

		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
	}
}