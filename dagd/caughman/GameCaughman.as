package dagd.caughman {
	
	import dagd.core.Game;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class GameCaughman extends Game {

		
		var player = new Player;
		var enemy = new Enemy;
		var boon = new Boon;
		
		//Compiling code for the Game
		public function GameCaughman() {
			
			creatorName = "Michael Caughman";
			gameTitle = "TBD";
			
			addChild(player);
			player.x = 500;
			player.y = 500;
			
			addChild(enemy);
			enemy.x = 250;
			enemy.y = 250;
			
			addChild(boon);
			boon.x = 600;
			boon.y = 600;
			
			boon.addEventListener(MouseEvent.CLICK, boonClick); 
			enemy.addEventListener(MouseEvent.CLICK, enemyClick); 
			
		}//End GameCaughman
		
		public function boonClick(e:MouseEvent): void{ 
			trace("+ 1 Point");
		}//End handleClick 
		public function enemyClick(e:MouseEvent): void{ 
			trace("- 1 Point");
		}//End handleClick 
		
		public function gameLoop(): void {
			
		}//End gameLoop
		
		
	}//End Class
}//End Package