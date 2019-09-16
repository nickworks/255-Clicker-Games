package dagd.breu {
	
	import flash.display.MovieClip;
	
	
	public class HUD extends MovieClip {
		
		
		public function HUD() {
			// constructor code
			this.x = 400;
			this.y = 78;
			this.gameOverText.alpha = 0;
			this.gameOverText.x = this.width/4 - this.gameOverText.width/2;
		}
		public function setScore(score:int):void
		{
			this.score.text = score.toString();
		}
		public function setCombo(comboMult:int):void
		{
			this.combo.text = comboMult.toString();
		}
		public function gameOver():void
		{
			
			this.gameOverText.alpha = 1;
			this.gameOverText.text = "Game Over";
		}
	}
	
}
