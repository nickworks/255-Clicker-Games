package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Spear extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		var sideTest: Number = 1;

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow: DropShadowFilter;
		var objectFilters: Array = new Array();

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

			dropShadow = new DropShadowFilter();
			dropShadow.blurX = 3.0;
			dropShadow.blurY = 3.0;
			dropShadow.strength = 0.8;
			dropShadow.angle = 90;
			dropShadow.distance = 4;
			var objectFilters: Array = new Array();
			objectFilters.push(dropShadow);
			filters = objectFilters;

			addEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}

		public function update() {
			if (!isHit) {
				var gravity: Number = 0.3;

				velocityY += gravity;

				x += velocityX;
				y += velocityY;

				rotation += velocityA;

				if (y > 780) isDead = true; //kill the object
			}
			if (isHit) {
				objectFilters.splice(0, 1); //removes #i from array
				dropShadow.strength -= 0.03;
				if (dropShadow.strength < 0) dropShadow.strength = 0; //clamp
				if (dropShadow.strength == 0) isDead = true; //kill the object
				objectFilters.push(dropShadow);
				filters = objectFilters;
			}
		}

		private function handleHover(e: MouseEvent) {
			isHit = true; //kill this object
			damage = 10; //damage the player
			dropShadow.hideObject = true;
			dropShadow.distance = 0;
			removeEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}
	}
}