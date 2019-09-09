package dagd.andrea 
{	
	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	import dagd.andrea.Balloon;
	import dagd.andrea.Ant;
	import dagd.andrea.Candy;

	public class GameAndrea extends Game 
	{		
		private var balloons:Array = new Array();
		private var ants:Array = new Array();
		private var candy:Array = new Array();
		
		public function GameAndrea() 
		{
			creatorName = "Vince Andrea";
			gameTitle = "Tricky Clicky";			
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}			
		
		public function gameLoop(e:Event):void
		{
			if (balloons.length < 10)
			{
				spawnBalloon();
			}
			
			for (var i:int = 0; i < balloons.length; i++)
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
						}
						else if(coinToss == false)
						{
							spawnCandy();
						}
					}
					
					removeChild(balloons[i]);
					balloons[i].dispose();
					balloons.splice(i,1);
					i--;
				}
			}
			
			for (var j:int = 0; j < ants.length; j++)
			{
				ants[j].update();
				if(ants[j].isDead == true)
				{
					removeChild(ants[j]);
					ants[j].dispose();
					ants.splice(j,1);
					j--;
				}
			}
			
			for (var k:int = 0; k < candy.length; k++)
			{
				candy[k].update();
				if(candy[k].isDead == true)
				{
					removeChild(candy[k]);
					candy[k].dispose();
					candy.splice(k,1);
					k--;
				}
			}
		}
		private function spawnBalloon():void
		{
			var roll = Math.random() * 100;
			if (roll < 2)
			{
				var b = new Balloon();
				balloons.push(b);
				addChild(b);
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
		}
	}
}
