package dagd.core {
	import flash.events.Event;
	
	/** This class defines the pause menu. */
	public class MenuPause extends Menu {
		
		private var h:Number = 0;
		private var doneExpanding:Boolean = false;
		private var doneFading:Boolean = false;
		
		public function MenuPause(){
			
			var onScreenWidth:int = 250;
			
			columns = 1;
			spacingY = 50;
			offsetY = 80;
			offsetX = App.main.stage.stageWidth - onScreenWidth;
			
			addOption(new ButtonMenuPause("Resume", function(){ App.main.hidePauseMenu(); }));
			addOption(new ButtonMenuPause("Exit to Menu", function(){
				App.main.hidePauseMenu();
				App.main.changeGame(new GameLauncher());
			}));
			
			var nudge:int = onScreenWidth + 5;
			for each(var bttn:Button in options){
				bttn.x += nudge;
				nudge += 100;
			}
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
		}
		public function update(e:Event):void {
			
			if(!doneExpanding) expandBG();
			if(!doneFading) slideInButtons();
			
		}
		private function slideInButtons():void {
			
			var isDone:Boolean = true;
			
			for(var i:int = 0; i < options.length; i++){
				var bttn:ButtonMenuPause = ButtonMenuPause(options[i]);
				if(!bttn.slideLeftTo(offsetX)) isDone = false;
			}
			doneFading = isDone;
		}
		private function expandBG():void {
			if(stage != null){

				var dh = (stage.stageHeight - h) * 0.25;
				if(dh > 30) dh = 30;
				if(dh < 1) {
					dh = (stage.stageHeight - h);
					doneExpanding = true;
				}
				h += dh;
				graphics.clear();
				graphics.beginFill(0x0, 0.8);
				graphics.drawRect(0,0,stage.stageWidth, h);
				graphics.endFill();
			}
		}
	}
}
