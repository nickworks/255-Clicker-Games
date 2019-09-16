package dagd.breu {

	import dagd.core.Game;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display3D.IndexBuffer3D;
	import dagd.core.App;

	public class GameBreu extends Game 
	{

		private var bubbles:Array = new Array();
		private var physics:Array = new Array();
		private var healths:Array = new Array();
		private var dashes:Array = new Array();
		private var statics:Array = new Array();
		private var walls:Array = new Array();
		private var healthBars:Array = new Array();
		private var comboBuilders:Array = new Array();
		
		private var bubCD:int = 0;
		private var physicCD:int = 180;
		private var healthCD:int = 120;
		private var dashCD:int = 60;
		private var staticCD:int = 240;
		private var wallCD:int = 600;	
		
		private var nHUD = new HUD;
		private var indexHUD:int = 0;
		
		private var currentHealth:int = 4;
		private var lastHealth:int = 4;
		
		private var currentCombo:int = 4;
		private var comboMult:int = 1;
		private var lastCombo = 4;
		
		private var score:int = 0;
		public function GameBreu() 
		{
			creatorName = "Nate Breu";
			gameTitle = "Click and point";
		}// end GameBreu()
		
		override public function onStart():void
		{
			addChild(nHUD);
			indexHUD = getChildIndex(nHUD);
			spawnHealthBar();
			comboSpawn();
			currentCombo--;
			addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		override public function onEnd():void
		{
			removeChild(nHUD);
			removeEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		private function gameLoop(e:Event):void 
		{
			if (App.main.isPaused == false)
			{
				if (currentHealth <= 0)
				{
					nHUD.gameOver();
					
				}
				else
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
					updateHealthBar();
					comboUpdate();
					nHUD.setScore(score);
					nHUD.setCombo(comboMult);
				}
			}
		}//end gameLoop();
		
		private function spawnBubble():void
		{

			var nBub = new bubble;
			
			bubbles.push(nBub);
			
			addChildAt(nBub,indexHUD);				
						
		}//end spawnBubble
		
		private function moveBubble():void
		{
			
			for (var i:int = 0; i < bubbles.length; i++)
			{

				bubbles[i].updateBubble();

				if (bubbles[i].isDead == true)//removes bubbles
				{
					if (bubbles[i].isClicked == true)//adds combo build up and score
					{
						currentCombo--;
						score += 10 * comboMult;
						bubbles[i].isClicked = false;
					}
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
			
			addChildAt(nPhysic,indexHUD);
		}
		private function movePhysic():void
		{
			
			for (var i:int = 0; i < physics.length; i++)
			{

				physics[i].updatePhysic();

				if (physics[i].isDead == true)//removes bubbles
				{
					if (physics[i].isClicked == true)//adds combo build up and score
					{
						currentCombo -= 2;
						score += 15 * comboMult;
						physics[i].isClicked = false;
					}
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
			
			addChildAt(nHealth,indexHUD);				
						
		}//end spawnBubble
		private function moveHealth():void
		{
			
			for (var i:int = 0; i < healths.length; i++)
			{

				healths[i].updateHealth();

				if (healths[i].isDead == true)//removes bubbles
				{
					if (healths[i].isClicked == true)//adds combo build up, score, and health
					{
						currentCombo--;
						score += 10 * comboMult;
						currentHealth++;
						healths[i].isClicked = false;
					}
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
			
			addChildAt(nDash,indexHUD);
		}//end spawnDash()
		private function moveDash():void
		{
			for (var i:int = 0; i < dashes.length; i++)
			{

				dashes[i].updateDash();

				if (dashes[i].isDead == true)//removes dashes
				{
					if (dashes[i].isClicked == true)//removes combo build up & health
					{
						currentCombo = 4;
						comboMult = 1;
						currentHealth--;
						dashes[i].isClicked = false;
					}
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
			
			addChildAt(nStatic,indexHUD);
		}//end spawnStatic()
		private function moveStatic():void
		{
			for (var i:int = 0; i < statics.length; i++)
			{

				statics[i].updateStatic();

				if (statics[i].isDead == true)//removes dashes
				{
					if (statics[i].isClicked == true)//removes combo build up & health
					{
						currentCombo = 4;
						comboMult = 1;
						currentHealth--;
						statics[i].isClicked = false;
					}
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
			
			addChildAt(nWall,indexHUD);
		}//end spawnWall()
		private function moveWall():void
		{
			for (var i:int = 0; i < walls.length; i++)
			{

				walls[i].updateWall();
				if (walls[i].isClicked == true)//removes combo build up
				{
					currentCombo = 4;
					comboMult = 1;
					walls[i].isClicked = false;
				}

				if (walls[i].isDead == true)//removes walls
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

		private function spawnHealthBar():void
		{
			var healthbarAdder:int = 0;
			for (var i:int = 0; i < currentHealth; i++)
			{
				var nHealthBar = new HealthBar;
			
				healthBars.push(nHealthBar);
			
				addChild(nHealthBar);
				
				healthBars[i].setX(healthbarAdder);
				healthbarAdder += 25;
				
			}
		}
		private function deleteHealthBar():void
		{
			if (currentHealth >= 0)
			{
				for (var i:int = lastHealth-1; i >= 0; i--)
				{
					removeChild(healthBars[i]);
				
					healthBars.splice(i , 1);
				}
			}
		}
		private function updateHealthBar():void
		{
			if (currentHealth > 4)
			{
				currentHealth = 4;
			}
			if (currentHealth < 0)
			{
				currentHealth = 0;
			}
			if (currentHealth != lastHealth)
			{
				deleteHealthBar();
				spawnHealthBar();
				lastHealth = currentHealth;
			}
			
		}
		private function comboUpdate():void
		{
			if (currentCombo > 4)
			{
				currentCombo = 4;
			}
			if (currentCombo < 0)
			{
				currentCombo +=4;
				comboMult++;
			}
			if (currentCombo != lastCombo)
			{
				comboDelete();
				comboSpawn();
				lastCombo = currentCombo;
			}
			
		}
		private function comboSpawn():void
		{
			var comboAdder:int = 0;
			for (var i:int = 0; i < currentCombo; i++)
			{
				var nCombo = new ComboBuild;
			
				comboBuilders.push(nCombo);
			
				addChild(nCombo);
				
				comboBuilders[i].setY(comboAdder);
				comboAdder += 9;
				
			}
		}
		private function comboDelete():void
		{
			if (currentCombo <= 4)
			{
				for (var i:int = lastCombo-1; i >= 0; i--)
				{
					removeChild(comboBuilders[i]);
				
					comboBuilders.splice(i , 1);
				}
			}
		}
	}//end GameBreu class
	
}//end dagd.breu pakage