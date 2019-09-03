package dagd.andrea {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameAndrea extends Game {
		
		var f:face;
		

		public function GameAndrea() 
		{
			creatorName = "Vince Andrea";
			gameTitle = "Ticky Clicky";
			
			f = new face();
			addChild(f);
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
						
		}
					
		

		
		public function gameLoop(e:Event):void
		{
			
			
			f.rotation += 4;
			f.x = Math.random() * stage.stageHeight;
			f.y = Math.random() * stage.stageWidth;
			
		}
	}
}