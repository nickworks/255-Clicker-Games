package dagd.breu {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Physic extends MovieClip {
		
		var isDead:Boolean = false;
		var isClicked:Boolean = false;
		var velX:Number = Math.random() * 10 - 5;//X velocity, between -5 & 5
		var velY:Number = 0;//y velocity
		var velA:Number = Math.random() * 20 - 10;//angular velocity, between -10 & 10
		var accY:Number = 1;//simulated acceleration
		var deathTimer:Number = 60 * 7;
		public function Physic() 
		{
			//size set
			this.width = 75; 
			this.height = 75; 
			
			//location set
			this.y = 0;
			this.x = Math.random() * 600 + 50;
			
			
			addEventListener(MouseEvent.MOUSE_DOWN, physicClick);
		}//end Physic() 
		
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.MOUSE_DOWN, physicClick); 
			 
		}//end of dispose() 
		
		private function physicClick(e:MouseEvent):void 
		{ 
			isClicked = true;
			isDead = true;
		}//end physicClick() 
		
		public function updatePhysic():void 
		{ 
			edgeCheck();
			this.x += velX;
			velY += accY;
			this.y += velY;
			deathTimer--;
			if (deathTimer <= 0)
			{
				isDead = true;
			}
		}//end updateDash()
		public function edgeCheck()
		{
			if (this.y >= 700 - this.height / 2)// bounces off bottom, until falling through
			{
				if( velY > 5)
				{
				velY -= 3;
				velY *= -1;
				}
			}
			if (this.x <= 0 + this.width / 2 || this.x >= 800 - this.width / 2)//bounces off side
			{
				velX *= -1;
			}
		}
	}
	
}
