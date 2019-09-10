package dagd.caughman {
	
	import dagd.core.Game;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class GameCaughman extends Game {
		var i:int = new int(0)
		var score:int = new int(0);
		var player = new Player;
		var guppy = new Guppy;
		var salmon = new Salmon;
		var marlin = new Marlin;
		var can = new Can;
		
		//Compiling code for the Game
		public function GameCaughman() {
			
			
			creatorName = "Michael Caughman";
			gameTitle = "Gone Fishing";
			
			addChild(player);
			player.x = 400;
			player.y = 400;
			
			addChild(guppy);
			guppy.x = 250;
			guppy.y = 250;
			
			addChild(salmon);
			salmon.x = 600;
			salmon.y = 600;
			
			addChild(marlin);
			marlin.x = 500;
			marlin.y = 500;
			
			guppy.addEventListener(MouseEvent.CLICK, boonClick); 
			//enemy.addEventListener(MouseEvent.CLICK, enemyClick); 
			
			//Add Functionality for Mouse = Player
			update();
			
		}//End GameCaughman
		
		public function boonClick(e:MouseEvent): void{ 
			trace("+ 1 Point")
			++i;
			trace(score);
			return;
		}//End handleClick 
		public function enemyClick(e:MouseEvent): void{ 
			trace("- 1 Point");
		}//End handleClick 
		
		public function gameLoop(): void {
			
		}//End gameLoop
		
		public function update(): void{
			score = i;
			i++;
			trace(score);
		}//End update

		
		
	}//End Class
}//End Package