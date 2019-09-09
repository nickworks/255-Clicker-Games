package dagd.andrea 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Balloon extends MovieClip 
	{
		
		public var isDead:Boolean = false;
		public var isPopped:Boolean = false;
		
		private var velocityX:Number;
		
		public function Balloon() 
		{
			x = (Math.random() * 400) + 200;
			y = (Math.random() * 100) + 600;
			velocityX = Math.random() * 4;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			
			if (direction != true)
			{
				velocityX = -velocityX;
			}
			
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
		
		public function update():void 
		{
			y -= 3;
			x += velocityX;
			
			if (x < -(this.width * .5) || x > (800 + (this.width * .5)) || y > (700 + (this.height * .5)))
			{
				isDead = true;
			}
			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			isDead = true;
			isPopped = true;
		}
		
	}
	
}

