package dagd.core {
	
	public class GameLauncher extends Game {
		
		private var menu:Menu;
		
		private var games:Vector.<Class> = new <Class>[
			Game,
			Game,
			Game,
			Game,
			Game,
			Game,
			Game,
			Game,
			Game,
			Game,
		];
		
		
		public function GameLauncher() {
			// constructor code
		}
		override public function onStart():void {
			
			menu = new Menu();
			addChild(menu);
			for each(var gameType:Class in games){
				var game = new gameType();
				menu.addOption(new ButtonMenuPause(game.gameTitle, function(){ App.main.changeGame(new Game()); }));
			}
		}
		override public function update():void {
			
		}
	}
}
