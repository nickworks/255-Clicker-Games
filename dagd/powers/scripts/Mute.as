package dagd.powers.scripts {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;

	public class Mute extends MovieClip {

		private var velocityX: Number = 0; //X velocity

		var sideTest: Number = 1;

		public var isHit: Boolean = false;
		public var isDead: Boolean = false;
		public var points = 0;
		public var damage = 0;

		var dropShadow1: DropShadowFilter;
		var dropShadow2: DropShadowFilter;
		var objectFilters: Array = new Array();

		public function Mute() {
			// constructor code
			sideTest = Math.random();

			if (sideTest >= 0.5) x = -50;
			else x = 850;
			y = Math.random() * 500 + 100;

			if (sideTest >= 0.5) velocityX = (Math.random() * 1) + 2; // Makes the spear fly across the screen from left to right
			else velocityX = (Math.random() * -1) - 2; // Makes the spear fly across the screen from right to left

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
				x += velocityX;

				if (sideTest >= 0.5 && x > 900) isDead = true; //kill the object
				else if (x < -100) isDead = true; //kill the object
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
			points = 50; //give the player points
			dropShadow1.hideObject = true;
			mouseEnabled = false;
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
}