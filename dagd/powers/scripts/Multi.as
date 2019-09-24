package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Multi extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		var sideTest: Number = 1;

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow1: DropShadowFilter;
		var dropShadow2: DropShadowFilter;
		var objectFilters: Array = new Array();

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

			dropShadow1 = new DropShadowFilter();
			dropShadow1.blurX = 8.0;
			dropShadow1.blurY = 8.0;
			dropShadow1.color = 0xFFFFFF;
			dropShadow1.strength = 1;
			dropShadow1.angle = 0;
			dropShadow1.distance = 0;
			dropShadow1.inner = false;
			objectFilters.push(dropShadow1);
			filters = objectFilters;

			dropShadow2 = new DropShadowFilter();
			dropShadow2.blurX = 8.0;
			dropShadow2.blurY = 8.0;
			dropShadow2.color = 0xFFFFFF;
			dropShadow2.strength = 1;
			dropShadow2.angle = 0;
			dropShadow2.distance = 0;
			dropShadow2.inner = true;
			objectFilters.push(dropShadow2);
			filters = objectFilters;

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function update() {
			if (!isHit) {
				var gravity: Number = -0.05;

				velocityY += gravity;

				x += velocityX;
				y += velocityY;

				rotation += velocityA;

				if (y < -50) isDead = true; //kill the object
			} else if (isHit) {
				objectFilters.splice(0, 2); //removes #i from array
				dropShadow1.strength -= 0.03;
				dropShadow2.strength -= 0.03;
				if (dropShadow1.strength < 0 || dropShadow2.strength < 0) {
					dropShadow1.strength = 0; //clamp
					dropShadow2.strength = 0; //clamp
				}
				if (dropShadow1.strength == 0 && dropShadow2.strength == 0) isDead = true; //kill the object
				objectFilters.push(dropShadow1);
				objectFilters.push(dropShadow2);
				filters = objectFilters;
			}
		}

		private function handleClick(e: MouseEvent) {
			isHit = true; //kill this object
			points = 200; //give the player points
			damage = -10; //damage the player
			dropShadow1.hideObject = true;
			mouseEnabled = false;
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);

		}
	}
}