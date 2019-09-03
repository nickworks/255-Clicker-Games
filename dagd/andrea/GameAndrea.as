package dagd.andrea {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;

	public class GameAndrea extends Game {
		
		var f:Face;
		

		public function GameAndrea() 
		{
			creatorName = "Vince Andrea";
			gameTitle = "Ticky Clicky";
			
			f = new Face();
			addChild(f);
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
						
		}
					
		

		
		public function gameLoop(e:Event):void
		{					
			f.rotation += 4;
			f.x = 400;
			f.y = 350;
			
		}
	}
}