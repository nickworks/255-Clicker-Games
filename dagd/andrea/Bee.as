package dagd.andrea {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	public class Bee extends MovieClip {
		
		public var isDead:Boolean = false;
		public var score:int;
		
		private var velocityX:Number;
		private var velocityY:Number;
		private var aliveTime:int;

		
		
		public function Bee() {
			var offset:int = Math.random() * 10 - 50;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			velocityX = Math.random() * 3;
			velocityY = Math.random() * 10 - 20;
			
			y = mouseY + offset;
			
			if (direction != true)
			{
				velocityX = -velocityX;
				offset = -offset;
			}
			
			x = mouseX + offset;
			
			
			addEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.ROLL_OVER, handleClick);
		}
		
		public function update():void 
		{
			aliveTime++;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			velocityX = Math.random() * 10;
			velocityY = Math.random() * 10;
			
			if (direction != true)
			{
				velocityX = -velocityX;
				velocityY = -velocityY;
			}
			
			y += velocityY;
			x += velocityX;
			
			
			if (x < -(this.width * .5) || x > (800 + (this.width * .5)) || y > (700 + (this.height * .5)))
			{
				isDead = true;
			}
			if(aliveTime >= 1800)
			{
				isDead = true;
			}
			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			isDead = true;
			score = -100;
		}
	}
	
}
