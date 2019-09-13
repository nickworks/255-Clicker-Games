package dagd.breu {
	
	import flash.display.MovieClip;
	
	
	public class ComboBuild extends MovieClip {
		
		
		public function ComboBuild() {
			// constructor code
			this.width = 7;
			this.height = 7;
			this.x = 715.5;
		}
		public function setY(adder:int):void
		{
			this.y = 61.5 + adder;
		}
	}
	
}
