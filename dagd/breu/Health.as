package dagd.breu {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Health extends MovieClip {
		
		var isOnRight:Boolean = false;
		var isDead:Boolean = false;
		var isClicked:Boolean = false;
		var velX:Number = 10;//X velocity
		var velY:Number = -30;//y velocity
		var accY:Number = .7;//simulated acceleration form gravity
		public function Health() 
		{
			//size set
			this.width = 85; 
			this.height = 85; 
			
			//location set
			if (Math.random() >= .5)
			{
				this.x = 0- this.width;
				isOnRight = false;
			}
			else
			{
				this.x = 800 + this.width;
				isOnRight = true;
				velX *= -1;
			}
			this.y = 700 + this.height;
			
			addEventListener(MouseEvent.MOUSE_DOWN, healthClick);
		}//end of Health()
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.MOUSE_DOWN, healthClick); 
			 
		}//end of dispose()
		
		private function healthClick(e:MouseEvent):void 
		{ 
			isClicked = true;
			isDead = true;
		}//end healthClick() 
		public function updateHealth():void 
		{
			this.x += velX;
			velY += accY;
			this.y += velY;
			
			if (isOnRight == false && this. x > 700 + this.width)
			{
				isDead = true;
			}
			if (isOnRight == true && this. x < 0 - this.width)
			{
				isDead = true;
			}
		}
	}
	
}
