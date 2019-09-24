package dagd.breu {
	
	import flash.display.MovieClip;
	
	
	public class HealthBar extends MovieClip {
		
		
		public function HealthBar() {
			// constructor code
			this.width = 20;
			this.height = 20;
			this.y = 74;
		}
		public function setX(adder:int):void
		{
			this.x = 155 + adder;
		}
	}
	
}
