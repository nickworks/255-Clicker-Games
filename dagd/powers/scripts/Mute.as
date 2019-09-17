package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Mute extends MovieClip {

		private var velocityX: Number = 0; //X velocity

		var sideTest: Number = 1;

		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		public function Mute() {
			// constructor code
			sideTest = Math.random();

			if (sideTest >= 0.5) x = -50;
			else x = 850;
			y = Math.random() * 500 + 100;

			if (sideTest >= 0.5) velocityX = (Math.random() * 1) + 2; // Makes the spear fly across the screen from left to right
			else velocityX = (Math.random() * -1) - 2; // Makes the spear fly across the screen from right to left

			addEventListener(MouseEvent.CLICK, handleClick);
		}

		public function update() {

			x += velocityX;

			if (sideTest >= 0.5 && x > 900) isDead = true; //kill the object
			else if (x < -100) isDead = true; //kill the object
		}

		private function handleClick(e: MouseEvent) {
			isDead = true; //kill this object
			points = 50; //give the player point
		}

		//this function is used for cleanup, ensuring no memory leaks
		public function dispose(): void {
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
	}
}