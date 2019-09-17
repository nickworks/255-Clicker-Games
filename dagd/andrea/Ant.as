package dagd.andrea {
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	
	public class Ant extends MovieClip 
	{
		public var isDead:Boolean = false;
		public var score:int;
		
		private var velocityX:Number;
		private var velocityY:Number;
		private var velocityA:Number;
		
		public function Ant() 
		{
			var offset:int = Math.random() * 10 - 50;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			velocityX = Math.random() * 3;
			velocityY = Math.random() * 10 - 20;
			velocityA = Math.random() * 10 - 5;
			
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
			var gravity:Number = 1;
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
			score = -300;
			isDead = true;
		}
	}
	
}
