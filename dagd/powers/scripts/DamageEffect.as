package dagd.powers.scripts {

	import flash.display.MovieClip;


	public class DamageEffect extends MovieClip {
		public var healthLow: Boolean = false;
		public var pulseEffect: Number = 0;

		public function DamageEffect() {
			// constructor code
			alpha = 0;
			mouseEnabled = false;
		}

		public function update(): void 
		{
			if (healthLow) {
				if (alpha >= 0.4) pulseEffect = -0.01;
				else if (alpha <= 0.2) pulseEffect = 0.01;
				alpha += pulseEffect;
			} 
			else {
				alpha -= 0.01;
				if (alpha <= 0) alpha = 0;
			}
		}
	}

}