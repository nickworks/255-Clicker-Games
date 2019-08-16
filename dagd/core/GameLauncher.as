package dagd.core {
	import flash.display.Bitmap;
	
	public class GameLauncher extends Game {
		
		private var menu:MenuMain;
		
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
			
			menu = new MenuMain(games);
			addChild(menu);
			
		}
		override public function update():void {
			
		}
	}
}
