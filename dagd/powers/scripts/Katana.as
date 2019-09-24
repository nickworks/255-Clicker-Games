package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Katana extends MovieClip {

		private var velocityY: Number = 0; //Y velocity

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow: DropShadowFilter;
		var objectFilters: Array = new Array();

		public function Katana() {
			// constructor code
			x = (Math.random() * 700) + 50;
			y = -80;

			velocityY = (Math.random() * -3) - 5; //Makes object shoot up at velocity between 30 and 35

			dropShadow = new DropShadowFilter();
			dropShadow.blurX = 3.0;
			dropShadow.blurY = 3.0;
			dropShadow.strength = 0.8;
			dropShadow.angle = 90;
			dropShadow.distance = 4;
			objectFilters.push(dropShadow);
			filters = objectFilters;

			addEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}

		public function update() {
			if (!isHit) {
				var gravity: Number = 0.2;

				velocityY += gravity;
				y += velocityY;

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
			damage = 25; //damage the player
			dropShadow.hideObject = true;
			dropShadow.distance = 0;
			removeEventListener(MouseEvent.MOUSE_OVER, handleHover);
		}
	}
}