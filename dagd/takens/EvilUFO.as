package dagd.takens {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import dagd.takens.GameTakens;
	
	public class EvilUFO extends MovieClip {
		
		
		public var velocityX: int;
		public var isDead: Boolean = false;
		public var wasClicked = false;
		public var Game:GameTakens;

		public function EvilUFO(game:GameTakens) {
			addEventListener(MouseEvent.ROLL_OVER, handleClick);
			Game = game;
		}

		public function update(): void {
			x += velocityX;
			if(x < -20 || x > 810){
				isDead = true;
			}
		}

		private function handleClick(e: MouseEvent): void {
			//hit player
			if(!Game.gameOver){
			Game.health -=20;
			Game.hurtSound();
			}
		}

		public function dispose(): void {
			removeEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
	}
	
}
