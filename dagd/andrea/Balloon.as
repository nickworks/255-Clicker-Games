package dagd.andrea 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Balloon extends MovieClip 
	{
		
		public var isDead:Boolean = false;
		public var isPopped:Boolean = false;
		public var score:int;
		
		private var velocityX:Number;
		
		public function Balloon() 
		{
			x = (Math.random() * 400) + 200;
			y = (Math.random() * 100) + 600;
			velocityX = Math.random() * 8 - 4;

			
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		
		public function update():void 
		{
			y -= 3;
			x += velocityX;
			
			if (x < -(this.width) || x > (800 + (this.width * .5)) || y < -(this.height * .5))
			{
				isDead = true;
			}
			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			score = 15;
			isDead = true;
			isPopped = true;
		}
		
	}
	
}

