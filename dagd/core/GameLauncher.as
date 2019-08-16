package dagd.core {
	import flash.display.Bitmap;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
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
		
				
		public var logo:Logo;
		public var showButtons:Boolean = false;
		
		public function GameLauncher() {
			logo = new Logo();
			logo.x = App.main.stage.stageWidth/2;
			logo.y = 100;
			logo.scaleY = logo.scaleX = 3;
			addChild(logo);
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			
			App.main.stage.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent){
				if(menu == null){
					showButtons = true;
					menu = new MenuMain(games);
					addChild(menu);
				}
			}, false, 0, true);
			
		}
		public function update(e:Event):void {
			var targetLogoScale:Number = showButtons ? .5 : .8;
			logo.scaleX += (targetLogoScale - logo.scaleX) * .1;
			logo.scaleY = logo.scaleX;			
			
			logo.y += ((showButtons ? 100 : 200) - logo.y) * .1;
		}
	}
}
