package dagd.breu {

	import dagd.core.Game;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class GameBreu extends Game 
	{

		private var bubbles:Array = new Array();
		private var physics:Array = new Array();
		private var healths:Array = new Array();
		private var dashes:Array = new Array();
		private var statics:Array = new Array();
		private var walls:Array = new Array();
		
		/*var bubTimer:Timer = new Timer(2000,0);
		var dashTimer:Timer = new Timer(3000,0);*/
		
		private var bubCD:int = 0;
		private var physicCD:int = 180;
		private var healthCD:int = 120;
		private var dashCD:int = 60;
		private var staticCD:int = 240;
		private var wallCD:int = 00;	
		
		public function GameBreu() 
		{
			
			creatorName = "Nate Breu";
			gameTitle = "Click and point";

			/*
			bubTimer.addEventListener(TimerEvent.TIMER, spawnBubble);
			bubTimer.start();
			
			dashTimer.addEventListener(TimerEvent.TIMER, spawnDash);
			dashTimer.start();
			*/
		}// end GameBreu()
		
		override public function onStart():void
		{
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		override public function onEnd():void
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function gameLoop(e:Event):void 
		{
			bubCD--;
			physicCD--;
			healthCD--;
			dashCD--;
			staticCD--;
			wallCD--;
			
			if (bubCD <= 0)
			{
				spawnBubble();
				bubCD = Math.random() * 30 + 60;
			}
			if (physicCD <= 0)
			{
				spawnPhysic();
				physicCD = Math.random() * 60 + 600;
			}
			if (healthCD <= 0)
			{
				spawnHealth();
				healthCD = Math.random() * 60 + 7*60;
			}
			if (dashCD <= 0)
			{
				spawnDash();
				dashCD = Math.random() * 60 + 90;
			}
			if (staticCD <= 0)
			{
				spawnStatic();
				staticCD = 3 * 60 + 30 +Math.random() * 60;
			}
			if (wallCD <= 0)
			{
				spawnWall();
				wallCD = 1200;
			}
			
			moveBubble();
			movePhysic();
			moveHealth();
			moveDash();
			moveStatic();
			moveWall();
			
			
		}//end gameLoop();
		
		private function spawnBubble():void
		{

			var nBub = new bubble;
			
			bubbles.push(nBub);
			
			addChild(nBub);				
						
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
		
		private function spawnPhysic():void
		{
			var nPhysic = new Physic;
			
			physics.push(nPhysic);
			
			addChild(nPhysic);
		}
		private function movePhysic():void
		{
			
			for (var i:int = 0; i < physics.length; i++)
			{

				physics[i].updatePhysic();

				if (physics[i].isDead == true)//removes bubbles
				{

					//1. remive rom scene graph
					removeChild(physics[i]);
					
					//2. remove from event listeners
					physics[i].dispose();
					
					//3. deref variable
					physics.splice(i , 1);
					
										
				}//end isDead if loop
				
			}
			
		}//end of movePhysic()
		private function spawnHealth():void
		{

			var nHealth = new Health;
			
			healths.push(nHealth);
			
			addChild(nHealth);				
						
		}//end spawnBubble
		private function moveHealth():void
		{
			
			for (var i:int = 0; i < healths.length; i++)
			{

				healths[i].updateHealth();

				if (healths[i].isDead == true)//removes bubbles
				{

					//1. remive rom scene graph
					removeChild(healths[i]);
					
					//2. remove from event listeners
					healths[i].dispose();
					
					//3. deref variable
					healths.splice(i , 1);
					
										
				}//end isDead if loop
				
			}
		}
		private function spawnDash():void
		{
			var nDash = new dash;
			
			dashes.push(nDash);
			
			addChild(nDash);
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
					
				}//end isDead if loop
				
			}
		}//end moveDash()
		
		private function spawnStatic():void
		{
			var nStatic = new Static;
			
			statics.push(nStatic);
			
			addChild(nStatic);
		}//end spawnStatic()
		private function moveStatic():void
		{
			for (var i:int = 0; i < statics.length; i++)
			{

				statics[i].updateStatic();

				if (statics[i].isDead == true)//removes dashes
				{

					//1. remive rom scene graph
					removeChild(statics[i]);
					
					//2. remove from event listeners
					statics[i].dispose();
					
					//3. deref variable
					statics.splice(i , 1);
					
				}//end isDead if loop
				
			}
		}//end moveStatic()
		
		private function spawnWall():void
		{
			var nWall = new Wall;
			
			walls.push(nWall);
			
			addChild(nWall);
		}//end spawnWall()
		private function moveWall():void
		{
			for (var i:int = 0; i < walls.length; i++)
			{

				walls[i].updateWall();

				if (walls[i].isDead == true)//removes dashes
				{

					//1. remive rom scene graph
					removeChild(walls[i]);
					
					//2. remove from event listeners
					walls[i].dispose();
					
					//3. deref variable
					walls.splice(i , 1);
					
				}//end isDead if loop
				
			}
		}//end moveWall()

	}//end GameBreu class
	
}//end dagd.breu pakage