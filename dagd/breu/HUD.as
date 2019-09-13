package dagd.breu {
	
	import flash.display.MovieClip;
	
	
	public class HUD extends MovieClip {
		
		
		public function HUD() {
			// constructor code
			this.x = 400;
			this.y = 78;
		}
		public function setScore(score:int):void
		{
			this.score.text = score.toString();
		}
		public function setCombo(comboMult:int):void
		{
			this.combo.text = comboMult.toString();
		}
	}
	
}
