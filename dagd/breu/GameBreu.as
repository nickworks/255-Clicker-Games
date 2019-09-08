package dagd.breu {

	import dagd.core.Game;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class GameBreu extends Game 
	{

		private var bubbles:Array = new Array();
		private var dashes:Array = new Array();
		
		var bubTimer:Timer = new Timer(2000,0);
		var dashTimer:Timer = new Timer(3000,0);
		
		public function GameBreu() 
		{
			
			creatorName = "Nate Breu";
			gameTitle = "Click and point";

			//likely to be move to a startTimers() function
			bubTimer.addEventListener(TimerEvent.TIMER, spawnBubble);
			bubTimer.start();
			
			dashTimer.addEventListener(TimerEvent.TIMER, spawnDash);
			dashTimer.start();
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
			
			
			
		}// end GameBreu()
		
		private function gameLoop(e:Event):void 
		{
			
			//spawnBubble
			
			moveBubble();
			
			//spawnDash();
			
			moveDash();
			
		}//end gameLoop();
		
		private function spawnBubble(e:TimerEvent):void
		{

			var bub = new bubble;
			
			bubbles.push(bub);
			
			addChild(bub);				
						
		}//end spawnBubble
		
		private function moveBubble():void
		{
			
			for (var i:int = 0; i < bubbles.length; i++)
			{

				bubbles[i].updateBubble();

				if (bubbles[i].isDead == true)//removes bubbles
				{

					//1. remive rom scene graph
					removeChild(bubbles[i]);
					
					//2. remove from event listeners
					bubbles[i].dispose();
					
					//3. deref variable
					bubbles.splice(i , 1);
					
										
				}//end isDead if loop
				
			}
			
		}//end of moveBubble()
		
		private function spawnDash(e:TimerEvent):void
		{
			var sDash = new dash;
			
			dashes.push(sDash);
			
			addChild(sDash);
		}//end spawnDash()
		private function moveDash():void
		{
			for (var i:int = 0; i < dashes.length; i++)
			{

				dashes[i].updateDash();

				if (dashes[i].isDead == true)//removes dashes
				{

					//1. remive rom scene graph
					removeChild(dashes[i]);
					
					//2. remove from event listeners
					dashes[i].dispose();
					
					//3. deref variable
					dashes.splice(i , 1);
					
				}//end isDead if loo
				
			}
		}//end moveDash()

	}//end GameBreu class
	
}//end dagd.breu pakage