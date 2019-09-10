package dagd.andrea 
{
	
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	import flash.events.MouseEvent;
	
	
	public class Candy extends MovieClip 
	{
		public var isDead:Boolean = false;
		
		private var velocityX:Number;		
		
		public function Candy() 
		{
			var offset:int = Math.random() * 10;
			var direction:Boolean = Boolean(Math.floor(Math.random() * 2));
			velocityX = Math.random() * 3;
			
			if (direction != true)
			{
				velocityX = -velocityX;
				offset = -offset;
			}
			
			x = mouseX + offset;
			y = mouseY + offset;
			
			addEventListener(MouseEvent.CLICK, handleClick);
		}
		
		public function dispose():void 
		{
			removeEventListener(MouseEvent.CLICK, handleClick);
		}
		
		public function update():void 
		{
			y += 3;
			x += velocityX;
			
			if (x < -(this.width * .5) || x > (800 + (this.width * .5)) || y > (700 + (this.height * .5)))
			{
				isDead = true;
			}			
		}
		
		private function handleClick(e:MouseEvent):void
		{
			isDead = true;
		}
	}
	
}
