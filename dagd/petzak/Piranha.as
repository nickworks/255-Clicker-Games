package dagd.petzak {

	import flash.display.MovieClip;

	public class Piranha extends BadFish {

		private var chaseLength: Number = Math.random() * 150 + 150
		private var attack: Boolean = true

		public function Piranha() {
			x = -200;
			y = Math.random() * 500 + 100;
			speed = 5;
			damage = 20;
		}
		
		public function update(xLoc: Number, yLoc: Number): void {
			
			chaseLength--;	
			
			if (touched)
				attack = false;

			if (chaseLength > 0 && attack) // keep chasing for 200 to 300 frames or until damage is dealt
				rotation = Math.atan2(yLoc - y, xLoc - x) * 180 / Math.PI;
			else
				gotoAndPlay(15); // stop moving mouth

			// move forward in direction of rotation
			x += speed * Math.cos(rotation * Math.PI / 180);
			y += speed * Math.sin(rotation * Math.PI / 180);
		}
	}
}