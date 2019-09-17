package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Spear extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		var sideTest: Number = 1;

		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		public function Spear() {
			// constructor code
			sideTest = Math.random();

			if (sideTest >= 0.5) x = -150;
			else x = 950;
			y = Math.random() * 300;

			if (sideTest >= 0.5) rotation = 0;
			else rotation = 180;

			if (sideTest >= 0.5) velocityX = (Math.random() * 10) + 10; // Makes the spear fly across the screen from left to right
			else velocityX = (Math.random() * -10) - 10; // Makes the spear fly across the screen from right to left

			velocityY = (Math.random() * 1) + 0.5; //Makes object shoot slowly fall down

			if (sideTest >= 0.5) velocityA = (Math.random() * 1) + 0.5; //Velocity for the rotation of the object
			else velocityA = (Math.random() * -1) - 0.5; //Velocity for the rotation of the object

			addEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}

		public function update() {

			var gravity: Number = 0.3;

			velocityY += gravity;

			x += velocityX;
			y += velocityY;

			rotation += velocityA;

			if (y > 780) isDead = true; //kill the object
		}

		private function handleHover(e: MouseEvent) {
			isDead = true; //kill this object
			damage = 10; //damage the player
		}

		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}
	}
}