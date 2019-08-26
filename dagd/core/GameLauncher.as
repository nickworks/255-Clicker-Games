package dagd.core {
	import flash.display.Bitmap;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.*;
	
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
		public var textHint:TextField;
		public var showButtons:Boolean = false;
		
		override public function onStart():void {
			logo = new Logo();
			logo.x = stage.stageWidth/2;
			logo.y = 100;
			logo.scaleY = logo.scaleX = 3;
			addChild(logo);
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			
			textHint = new TextField();
			addChild(textHint);			
			textHint.autoSize = TextFieldAutoSize.CENTER;
			textHint.defaultTextFormat = new TextFormat("Arial", 40, 0x666666, null, null, null, null, null, TextFormatAlign.CENTER);			
			textHint.x = stage.stageWidth / 2;
			textHint.y = 450;
			textHint.text = "Click to continue";
			textHint.alpha = 0;
			textHint.selectable = false;
			
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
			textHint.alpha += ((showButtons ? 0 : 1) - textHint.alpha) * .1;
		}
	}
}
