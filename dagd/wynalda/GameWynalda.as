package dagd.wynalda {

	import dagd.core.Game;

	public class GameWynalda extends Game {

		public function GameWynalda() {
			creatorName = ("Jordan Wynalda");
			gameTitle = ("Tree Wacker");

			var art: Art = new Art; // create sky background variable
			addChild(art); // sky background
			art.x = 0; // aligning background
			art.y = 0; // aligning background

			scaleX = 1.3; // re-sizing background
			scaleY = scaleX; // re-sizing background

		}


	}
}