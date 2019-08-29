package dagd.breu {
	
	import dagd.core.Game;
	import flash.display.MovieClip;
	
	public class GameBreu extends Game {


		public function GameBreu() 
		{
			
			creatorName = "Nate Breu";
			gameTitle = "Click and point";
			
			trace("test");
			
			
		}
		
			
			var BC:MovieClip = new MovieClip;
			var GC:MovieClip = new MovieClip;
			
			var randomBH:Number;
			var randomBW:Number;
			
			var randomGH:Number;
			var randomGW:Number;
			

		public function SpawnObjects()
		{
			ChangeLocation();
			
			BC.x = randomBW;
			BC.y = randomBH;
			
			GC.x = randomGW;
			GC.y = randomGH;
			
			addChild(BC);
			addChild(GC);
			
		}
		
		public function ChangeLocation()
		{
			randomBH = Math.random() * stage.stageHeight;
			randomBW = Math.random() * stage.stageWidth;
			randomGH = Math.random() * stage.stageHeight;
			randomGW = Math.random() * stage.stageWidth;
			
			trace(randomBH + "  " + randomBW + "  " + randomGH + "  " + randomGW);
		}
		
	}
}