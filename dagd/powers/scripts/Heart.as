package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Heart extends MovieClip {

		private var velocityX: Number = 0; //X velocity
		private var velocityY: Number = 0; //Y velocity
		private var velocityA: Number = 0; //angular velocity

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow1: DropShadowFilter;
		var dropShadow2: DropShadowFilter;
		var objectFilters: Array = new Array();

		public function Heart() {
			// constructor code
			x = (Math.random() * 700) + 50;
			y = 730;

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

			velocityX = Math.random() * 5 - 2.5; // -2.5 to +2.5
			velocityY = (Math.random() * -6) - 10; //Makes object shoot up at velocity between 30 and 35
			velocityA = (Math.random() * 2) - 1; //Velocity for the rotation of the object

			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}

		public function update() {
			if (!isHit) {
				var gravity: Number = 0.3;

				velocityY += gravity;

				x += velocityX;
				y += velocityY;

				rotation += velocityA;

				if (y > 760) isDead = true; //kill the object
			}
			if (isHit) {
				objectFilters.splice(0, 2); //removes #i from array
				dropShadow1.strength -= 0.03;
				dropShadow2.strength -= 0.03;
				if (dropShadow1.strength < 0 || dropShadow2.strength < 0) {
					dropShadow1.strength = 0; //clamp
					dropShadow2.strength = 0;//clamp
				}
				if (dropShadow1.strength == 0 && dropShadow2.strength == 0) isDead = true; //kill the object
				objectFilters.push(dropShadow1);
				objectFilters.push(dropShadow2);
				filters = objectFilters;
			}
		}

		private function handleClick(e: MouseEvent) {
			isHit = true; //kill this object
			points = 100; //give the player points
			damage = -20; //damage the player
			dropShadow1.hideObject = true;
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
}