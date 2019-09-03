package dagd.breu {

	import dagd.core.Game;
	import flash.events.Event;

	public class GameBreu extends Game 
	{


		private var bubbles:Array = new Array();
		
		public function GameBreu() 
		{
			
			creatorName = "Nate Breu";
			gameTitle = "Click and point";
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
			
		}// end GameBreu()
		
		private function gameLoop(e:Event):void 
		{

			spawnBubble();
			
			//moveBubble();
			
		}//end gameLoop();
		
		private function spawnBubble():void
		{

			var bub = new bubble();
			
			bubbles.push(bub);
			
			addChild(bub);
			
			
		}//end spawnBubble

	}//end GameBreu class
	
}//end dagd.breu pakage