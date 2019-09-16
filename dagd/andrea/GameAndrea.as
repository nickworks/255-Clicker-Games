package dagd.andrea 
{	
	import dagd.core.Game;
	import dagd.core.App;
	import flash.display.MovieClip;
	import flash.events.Event;
	import dagd.andrea.Balloon;
	import dagd.andrea.Ant;
	import dagd.andrea.Candy;
	import dagd.andrea.Can;
	import dagd.andrea.Bee;
	import dagd.andrea.Bird;
	import dagd.andrea.MyHUD;

	public class GameAndrea extends Game 
	{		
		private var balloons:Array = new Array();
		private var ants:Array = new Array();
		private var candy:Array = new Array();
		private var cans:Array = new Array();
		private var bees:Array = new Array();
		private var birds:Array = new Array();
		private var countdownTimer:int = 0;
		private var playTimer:int = 0;
		private var score:int = 0;
		private var lives:int = 5;
		private var combo:int = 0;
		private var hud:MyHUD = new MyHUD;

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
			
			addChild(hud);
		}
		
		override public function onEnd():void
		{
			removeEventListener(Event.ENTER_FRAME, gameLoop);
			//balloonTimer.removeEventListener(TimerEvent.TIMER, spawnBalloon);
		}
		
		public function gameLoop(e:Event):void
		{
			if(App.main.isPaused) 
			{
				hud.makeVisible(false);
				return;
			}
			
			if(lives == 0)
			{
				trace("Game Over! Score: " + score);
				App.main.isPaused = true;
				hud.setLives(lives = 5);
				hud.setScore(score = 0);
				hud.setCombo(combo = 0);
				restart();
			}
			
			hud.makeVisible(true);
			
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
			updateCans();
			updateBirds();
			updateBees();
			//trace(balloons.length);
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
					hud.setScore(score += ants[j].score);
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
					hud.setScore(score += balloons[i].score);
					if(balloons[i].isPopped == true)
					{
						score += balloons[i].score;
						var coinToss:Boolean = Boolean(Math.floor(Math.random() * 2));
						if(coinToss == true)
						{
							var roll:int = Math.floor(Math.random() * 3);
							switch (roll)
							{
								case 0:
									spawnBee();
								break;
								case 1:
									spawnBird();
								break;
								case 2:
									spawnAnt();
								break;
							}
						}
						else if(coinToss == false)
						{
							var negRoll:int = Math.floor(Math.random() * 2);
							switch (negRoll)
							{
								case 0:
									spawnCandy();
								break;
								case 1:
									spawnCan();
								break;
							}
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
					hud.setScore(score += candy[k].score);
					removeChild(candy[k]);
					candy[k].dispose();
					candy.splice(k,1);
					--k;
				}
			}
		}
		
		private function updateBirds():void
		{
			for (var z:int = 0; z < birds.length; z++)
			{
				birds[z].update();
				if(birds[z].isDead == true)
				{
					hud.setLives(lives += birds[z].lives);
					birds[z].dispose();
					birds[z].parent.removeChild(birds[z]);	
					birds.splice(z, 1);
					--z;
				}
			}
		}
		
		private function updateBees():void
		{
			for (var m:int = 0; m < bees.length; m++)
			{
				bees[m].update();
				if(bees[m].isDead == true)
				{
					hud.setScore(score += bees[m].score);
					bees[m].dispose();
					removeChild(bees[m]);
					bees.splice(m, 1);
					--m;
				}
			}
		}
		
		private function updateCans():void
		{
			for (var n:int = 0; n < cans.length; n++)
			{
				cans[n].update();
				hud.setCombo(cans[n].combo);
				if(cans[n].isDead == true)
				{
					hud.setScore(score += cans[n].score);
					hud.setCombo(0);
					removeChild(cans[n]);
					cans[n].dispose();
					cans.splice(n, 1);
					--n;
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
		
		private function spawnCan():void
		{
			var can = new Can();
			cans.push(can);
			addChild(can);
		}
		
		private function spawnBee():void
		{
			var bee = new Bee();
			bees.push(bee);
			addChild(bee);
		}
		
		private function spawnBird():void
		{
			var bird = new Bird();
			birds.push(bird);
			addChild(bird);
		}
		
		private function restart():void
		{
			playTimer = 0;
			countdownTimer = 0;
			for (var j:int = 0; j < ants.length; j++)
			{
				removeChild(ants[j]);
				ants[j].dispose();
				ants.splice(j,1);
				--j;				
			}
			for (var k:int = 0; k < candy.length; k++)
			{
				removeChild(candy[k]);
				candy[k].dispose();
				candy.splice(k,1);
				--k;			
			}
			for (var z:int = 0; z < birds.length; z++)
			{
				birds[z].dispose();
				birds[z].parent.removeChild(birds[z]);	
				birds.splice(z, 1);
				--z;				
			}
			for (var m:int = 0; m < bees.length; m++)
			{
				bees[m].dispose();
				removeChild(bees[m]);
				bees.splice(m, 1);
				--m;				
			}
			for (var n:int = 0; n < cans.length; n++)
			{
				removeChild(cans[n]);
				cans[n].dispose();
				cans.splice(n, 1);
				--n;			
			}
			for (var i:int = balloons.length - 1; i >= 0 ; i--)
			{				
				balloons[i].dispose();
				removeChild(balloons[i]);					
				balloons.splice(i,1);				
			}
		}
	}
}
