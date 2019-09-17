package dagd.andrea {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	
	public class Bird extends MovieClip {
		
		public var isDead:Boolean = false;
		public var lives:int = 0;
		
		private var velocityX:Number;
		private var numPasses:int;
		private var totalPasses:int;
		
		
		public function Bird() {
			velocityX = Math.random() * 3 + 3;
			totalPasses = Math.random() * 10;
			var offset:int = Math.random() * 10 - 50;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			
			
			if (direction != true)
			{
				offset = -offset;
			}
			
			x = mouseX + offset;
			y = mouseY + offset;
			
			addEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
		
		public function update():void 
		{

			x += velocityX;
			
			if (x < -(this.width * .5) || x > (800 + (this.width * .5)) || y > (700 + (this.height * .5)))
			{
				numPasses++;
				if (numPasses >= totalPasses)
				{
					isDead = true;
				}
				x = 0;
				y = Math.random() * 600 + 100;
			}
			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			isDead = true;
			lives = -1;
		}
	}
	
}
