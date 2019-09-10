package dagd.andrea 
{	
	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import dagd.andrea.Balloon;
	import dagd.andrea.Ant;
	import dagd.andrea.Candy;
	//import dagd.andrea.MyHUD;

	public class GameAndrea extends Game 
	{		
		private var balloons:Array = new Array();
		private var ants:Array = new Array();
		private var candy:Array = new Array();
		private var countdownTimer:int = 0;
		private var playTimer:int = 0;
		//private var hud:MyHUD;
		//private var balloonTimer:Timer = new Timer(2000,0);
		
		public function GameAndrea() 
		{
			creatorName = "Vince Andrea";
			gameTitle = "Tricky Clicky";			
			
			//balloonTimer.addEventListener(TimerEvent.TIMER, spawnBalloon);
			//balloonTimer.start();
			
			//addChild(hud);
			
		}	
		
		override public function onStart():void
		{
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		override public function onEnd():void
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			//balloonTimer.removeEventListener(TimerEvent.TIMER, spawnBalloon);
		}
		
		public function gameLoop(e:Event):void
		{
			if(App.main.isPaused) return; 
			
			playTimer++;
			countdownTimer--;
			if(countdownTimer <= 0)
			{
				spawnBalloon();

				var min:int = 30;
				if(playTimer > 600) min = 30;
				if(playTimer > 2400) min = 15;
				
				countdownTimer = Math.random() * 60 + min;
			}
			
			
			updateAnts();
			updateBalloons();
			updateCandy();	
			trace(balloons.length);
		}
			

		private function spawnBalloon():void
		{
			//var roll = Math.random() * 100;
			//if (roll < 2)
			//{
			var b = new Balloon();
			balloons.push(b);
			addChild(b);
			//}
		}
		private function updateAnts():void
		{
			for (var j:int = 0; j < ants.length; j++)
			{
				ants[j].update();
				if(ants[j].isDead == true)
				{
					removeChild(ants[j]);
					ants[j].dispose();
					ants.splice(j,1);
					--j;
				}
			}
		}
		
		private function updateBalloons():void
		{
			for (var i:int = balloons.length - 1; i >= 0 ; i--)
			{
				balloons[i].update();
				if(balloons[i].isDead == true)
				{
					if(balloons[i].isPopped == true)
					{
						var coinToss:Boolean = Boolean(Math.floor(Math.random() * 2));
						if(coinToss == true)
						{
							spawnAnt();
							//trace("Ants: " + ants.length);
						}
						else if(coinToss == false)
						{
							spawnCandy();
							//trace("Candy: " + candy.length);
						}
					}
					
					balloons[i].dispose();
					removeChild(balloons[i]);					
					balloons.splice(i,1);
					
				}
			}
			
		}
		
		private function updateCandy():void
		{
			for (var k:int = 0; k < candy.length; k++)
			{
				candy[k].update();
				if(candy[k].isDead == true)
				{
					removeChild(candy[k]);
					candy[k].dispose();
					candy.splice(k,1);
					--k;
				}
			}
		}
		private function spawnAnt():void
		{
			var a = new Ant();
			ants.push(a);
			addChild(a);
		}
		
		private function spawnCandy():void
		{
			var c = new Candy();
			candy.push(c);
			addChild(c);
			//var index:int = getChildIndex(hud);
			//addChildAt(c, index);
		}
	}
}
