package dagd.andrea {
	
	import flash.display.MovieClip;
	
	
	public class MyHUD extends MovieClip {
		
		
		public function MyHUD() 
		{
			x = -40
			y = 5
			this.txtLives.visible = false;
			this.txtScore.visible = false;
			this.txtCombo.visible = false;
		}
		public function setScore(score:int):void
		{
			this.txtScore.text = "Score: " + score;
		}
		public function setCombo(combo:int):void
		{
			this.txtCombo.text = "Can Combo: " + combo;
		}
		public function setLives(lives:int):void
		{
			this.txtLives.text = "Lives: " + lives;
		}
		
		public function makeVisible(isVisible:Boolean):void
		{
			if (isVisible == true)
			{
				this.txtLives.visible = true;
				this.txtScore.visible = true;
				this.txtCombo.visible = true;
			}
			if (isVisible == false)
			{
				this.txtLives.visible = false;
				this.txtScore.visible = false;
				this.txtCombo.visible = false;
			}
		}
	}
	
}
