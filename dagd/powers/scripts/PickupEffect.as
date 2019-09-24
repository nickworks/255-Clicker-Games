package dagd.powers.scripts {

	import flash.display.MovieClip;

	public class PickupEffect extends MovieClip {

		public function PickupEffect() {
			// constructor code
			alpha = 0;
			mouseEnabled = false;
		}

		public function update(): void {
			alpha -= 0.01;
			if (alpha <= 0) alpha = 0;
		}
	}

}