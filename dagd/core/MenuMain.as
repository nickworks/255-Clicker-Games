package dagd.core {
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class MenuMain extends Menu {
		
		public function MenuMain(games:Vector.<Class>) {
			offsetX = 75;
			offsetY = 230;
			spacingY = 70;
			spacingX = 350;
			columns = 2;
			
			
			for each(var gameType:Class in games){
				var game = new gameType();
				
				var title:String = game.gameTitle;
				var img:Bitmap = game.bannerImage == null ? null : new Bitmap(new game.bannerImage());
				
				addMenuOption(new ButtonMenuMain(title, img, gameType));
			}
			
			addEventListener(Event.ENTER_FRAME, update, false, 0, true);
			
		}
		public function addMenuOption(bttn:ButtonMenuMain):void {
			
			var col:int = options.length % columns;
			var row:int = options.length / columns;
			bttn.targetX = offsetX + col * spacingX;
			bttn.x = bttn.targetX + ((col == 0) ? - 1 : 1) * 450;
			bttn.y = offsetY + row * spacingY;
			bttn.speed = (row * 5) * (col == 0 ? -1 : 1);
			options.push(bttn);
			addChild(bttn);
			
		}
		public function update(e:Event):void {
			
			
			for each(var bttn:Button in options){
				ButtonMenuMain(bttn).slideToTarget();
			}
			
		}
	}	
}