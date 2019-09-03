package dagd.wynalda {
	
	import dagd.core.Game;
	
	public class GameWynalda extends Game {

		public function GameWynalda() {
			creatorName = ("Jordan Wynalda");
			gameTitle = ("Tree Wacker");
			
			var art: Art = new Art;
			addChild(art);
			art.x = 300;
			art.y = 350;
			
		}
	}
}