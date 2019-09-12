package dagd.breu {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Wall extends MovieClip {
		
		var isDead:Boolean = false; 
		var isClicked:Boolean = false;
		var wallStopTimer:Number = 0;
		
		public function Wall() {
			// set size
			this.width = 30; 
			this.height = 800; 
			 
			//set location
			this.x = 800 / 2 - this.width / 2; 
						 
			this.y = 0 - this.height;
			 
			addEventListener(MouseEvent.MOUSE_OVER, wallClick); 
		}//end Wall()
		
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.MOUSE_OVER, wallClick); 
			 
		}//end of dispose() 
		 
		public function updateWall():void 
		{ 
			if (this.y < 0 + this.height / 2 )
			{
				this.y += 6;
			}
			else if (wallStopTimer > 600)
			{
				this.y += 6;
			}
			else
			{
				wallStopTimer++;
			}
			if (this.y > 700 + this.height / 2)
			{
				isDead = true;
				trace("im dead!");
			}
		}//end updateDash() 
		 
		private function wallClick(e:MouseEvent):void 
		{ 
			isClicked = true;			 
		}//end dashclick()
	}
	
}
