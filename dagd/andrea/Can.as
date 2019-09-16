package dagd.andrea {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	
	public class Can extends MovieClip {
		
		public var isDead:Boolean = false;
		public var score:int;
		
		private var velocityX:Number;
		private var velocityY:Number;
		private var velocityA:Number;
		private var timesHit:int;
		
		
		
		public function Can() {
			
			var offset:int = Math.random() * 10 - 50;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			velocityX = Math.random() * 3;
			velocityY = Math.random() * 7 - 14;
			velocityA = Math.random() * 10 - 5;
			
			
			y = mouseY + offset;
			
			if (direction != true)
			{
				velocityX = -velocityX;
				offset = -offset;
			}
			
			x = mouseX + offset;
			
			
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function update():void 
		{
			var gravity:Number = .25;
			velocityY += gravity;
			
			y += velocityY;
			x += velocityX;
			
			rotation += velocityA;
			
			if (x < -(this.width * .5) || x > (800 + (this.width * .5)) || y > (700 + (this.height * .5)))
			{
				isDead = true;
			}
			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			velocityX = Math.random() * 3;
			velocityY = Math.random() * 10 - 15;
			velocityA = Math.random() * 10 - 5;
			
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			
			if (direction != true)
			{
				velocityX = -velocityX;
			}
			timesHit++;
			score = ((timesHit ^ 2) * 100);
			trace(score);
				
		}
	}
	
}
