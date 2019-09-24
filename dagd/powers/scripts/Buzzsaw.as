package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Buzzsaw extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow: DropShadowFilter;
		var objectFilters: Array = new Array();

		public function Buzzsaw() {
			// constructor code
			x = (Math.random() * 700) + 50;
			y = 730;

			velocityX = Math.random() * 5 - 2.5; // -2.5 to +2.5
			velocityY = (Math.random() * -5) - 15; //Makes object shoot up at velocity between 30 and 35
			velocityA = (Math.random() * 10) + 10; //Velocity for the rotation of the object

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

				if (y > 760) isDead = true; //kill the object
			} else if (isHit) {
				objectFilters.splice(0, 1); //removes #i from array
				dropShadow.strength -= 0.03;
				if (dropShadow.strength < 0) dropShadow.strength = 0;
				if (dropShadow.strength == 0) isDead = true;
				objectFilters.push(dropShadow);
				filters = objectFilters;
			}
		}

		private function handleHover(e: MouseEvent) {
			isHit = true; //kill this object
			mouseEnabled = false; //disable mouse to prevent further damage
			damage = 20; //damage the player
			dropShadow.hideObject = true;
			dropShadow.distance = 0;
			removeEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}
	}
}