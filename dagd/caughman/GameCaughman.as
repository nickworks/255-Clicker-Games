package dagd.caughman {
	
	import dagd.core.*;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	
	public class GameCaughman extends Game {
		private var health:Number =2000;
		private var score:Number = 0;
		private var xAtFullHealth:Number;
		
		private var countdownTimerG:int = 0;
		private var countdownTimerS:int = 0;
		private var countdownTimerM:int = 0;
		private var countdownTimerC:int = 0;
		private var countdownTimerB:int = 0;
		private var countdownTimerBag:int = 0;
		
		private var hud:MyHUD;
		private var guppys:Array = new Array();
		private var salmons:Array = new Array();
		private var marlins:Array = new Array();
		private var cans:Array = new Array();
		private var boots:Array = new Array();
		private var bags:Array = new Array();
		
		//Compiling code for the Game
		public function GameCaughman() {
			
			
			creatorName = "Michael Caughman";
			gameTitle = "Gone Fishing";
			
		}//End GameCaughman
		
			override public function onStart(): void{
				hud = new MyHUD();
				addChild(hud);
				xAtFullHealth = hud.healthBar.x;
				hud.scoreboard.autoSize = TextFieldAutoSize.RIGHT;
				
				addEventListener(Event.ENTER_FRAME, gameLoop);
			}//gameStart
		
			public function gameLoop(e:Event): void {
				
				countdownTimerG--;
				countdownTimerS--;
				countdownTimerM--;
				countdownTimerC--;
				countdownTimerB--;
				countdownTimerBag--;
				
				var index:int = getChildIndex(hud);
				//Pauses the game
				if(App.main.isPaused) return;
				
				//Guppy Spawner
				if(countdownTimerG <=0){
					var g:Guppy = new Guppy();
					addChildAt(g, index);
					guppys.push(g);
					//resets the timer
					countdownTimerG = 50;
					}
					
					//update all Guppys
				for(var i:int = guppys.length-1; i>=0;i--){
					guppys[i].update();
					
					if(guppys[i].isDead){
						score+= guppys[i].points;
						health+= guppys[i].points/2;
						guppys[i].dispose();//remove event listeners
						removeChild(guppys[i]);//remove from scene graph
						guppys.removeAt(i);//remove from the array
					}	
				}
				
				//Salmon Spawner
				if(countdownTimerS <=0){
					var s:Salmon = new Salmon();
					addChildAt(s, index);
					guppys.push(s);
					//resets the timer
					countdownTimerS = 100;
					}	
				//update all Salmons
				for(var o:int = salmons.length-1; o>=0;o--){
					salmons[o].update();
					
					if(salmons[o].isDead){
						score+= salmons[o].points;
						health+= salmons[o].points/2;
						salmons[o].dispose();//remove event listeners
						removeChild(salmons[o]);//remove from scene graph
						salmons.removeAt(o);//remove from the array
					}	
				}
				
				//Marlin Spawner
				if(countdownTimerM <=0){
					var m:Marlin = new Marlin();
					addChildAt(m, index);
					marlins.push(m);
					//resets the timer
					countdownTimerM = 200;
					}
					
					//update all Marlins
				for(var p:int = marlins.length-1; p>=0;p--){
					marlins[p].update();
					
					if(marlins[p].isDead){
						score+= marlins[p].points;
						health+= marlins[p].points/2;
						marlins[p].dispose();//remove event listeners
						removeChild(marlins[p]);//remove from scene graph
						marlins.removeAt(p);//remove from the array
					}	
				}
					
					//Can Spawner
				if(countdownTimerC <=0){
					var c:Can = new Can();
					addChildAt(c, index);
					cans.push(c);
					//resets the timer
					countdownTimerC = 50;
					}
					
				//update all Cans
				for(var k:int = cans.length-1; k>=0;k--){
					cans[k].update();
					
					if(cans[k].isDead){
						score+= cans[k].points;
						health+= cans[k].points*2;
						cans[k].dispose();//remove event listeners
						removeChild(cans[k]);//remove from scene graph
						cans.removeAt(k);//remove from the array
					}	
				}
				
					//Boot Spawner
				if(countdownTimerB <=0){
					var b:Boot = new Boot();
					addChildAt(b, index);
					boots.push(b);
					//resets the timer
					countdownTimerB = 250;
					}
					
				//update all Boots
				for(var l:int = boots.length-1; l>=0;l--){
					boots[l].update();
					
					if(boots[l].isDead){
						score+= boots[l].points;
						health+= boots[l].points*2;
						boots[l].dispose();//remove event listeners
						removeChild(boots[l]);//remove from scene graph
						boots.removeAt(l);//remove from the array
					}	
				}
				
				//Bags Spawner
				if(countdownTimerBag <=0){
					var bg:Bag = new Bag();
					addChildAt(bg, index);
					bags.push(bg);
					//resets the timer
					countdownTimerBag = 250;
					}
					
				//update all Bags
				for(var z:int = bags.length-1; z>=0;z--){
					bags[z].update();
					
					if(bags[z].isDead){
						score+= bags[z].points;
						health+= bags[z].points*2;
						bags[z].dispose();//remove event listeners
						removeChild(bags[z]);//remove from scene graph
						bags.removeAt(z);//remove from the array
					}	
				}
	
			health--;//hurt the player
			var h:Number = (health/2000);//health as a percent
				if (h <0) h = 0;//clamps the min
				if (h >1) h = 1;//clamps the max t0 1
				hud.healthBar.scaleX= h; //set width of health bar
				
			hud.healthBar.x=xAtFullHealth - (1 - h) * hud.healthBar.width;	
			hud.scoreboard.text ="Score: " + score;
		}//End gameLoop
		
	}//End Class
	
}//End Package