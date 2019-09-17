package dagd.petzak {

	import flash.display.MovieClip;
	import flash.text.TextFormat;

	public class HUD extends MovieClip {

		public var healthBar: HealthBar = new HealthBar();

		public function HUD() {
			y = 52;
			addChild(healthBar);
			healthBar.x = 13;
			healthBar.y = 602;
		}
	}
}