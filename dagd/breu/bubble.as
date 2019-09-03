package dagd.breu {
	
	import flash.display.MovieClip;
	
	
	public class bubble extends MovieClip 
	{
		
		
		public function bubbleClick() {
			
			this.x = 300 - this.width;
			
			this.y = Math.random() * 700
			
			var startYLocation:Number = this.y;
			
			var traveUp:Boolean = false;
			
		}
	}
		
}
