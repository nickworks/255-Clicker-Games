package dagd.caughman {
	
	import dagd.core.Game;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	
	public class GameCaughman extends Game {
		private var health:Number =0;
		private var score:Number = 0;

		private var guppys:Array = new Array();
		
		//Compiling code for the Game
		public function GameCaughman() {
			
			
			creatorName = "Michael Caughman";
			gameTitle = "Gone Fishing";
			
		}//End GameCaughman
		
			override public function onStart(): void{
				
				addEventListener(Event.ENTER_FRAME, gameLoop);
			}//gameStart
		
			public function gameLoop(e:Event): void {
				
				//spawn a thing:
				var g:Guppy = new Guppy();
				//var index:int = getChildIndex(hud);
				addChild(g);
				guppys.push(g);
				
				//update all things:
				for(var i:int = guppys.length-1; i>=0;i--){
					guppys[i].update();
					
					if(guppys[i].isDead){
						score+= guppys[i].points;
						guppys[i].dispose();//remove event listeners
						removeChild(guppys[i]);//remove from scene graph
						guppys.removeAt(i);//remove from the array
					}
					
				}
			
		}//End gameLoop
		



		
		
	}//End Class
}//End Package