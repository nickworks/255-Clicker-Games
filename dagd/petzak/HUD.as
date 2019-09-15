package dagd.petzak {

	import flash.display.MovieClip;
	import flash.text.TextFormat;

	//import flash.text;

	public class HUD extends MovieClip {

		private var multiplier: Number = 1;

		public var healthBar: HealthBar = new HealthBar();

		public function HUD() {
			y = 52;
			addChild(healthBar);
			healthBar.x = 11;
			healthBar.y = 611;
		}
	}
}