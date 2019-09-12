package dagd.breu {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Static extends MovieClip {
		
		var isDead:Boolean = false; 
		var isClicked:Boolean = false;
		var determineLocation:Number = Math.random() * 4;
		var timerTicks:Number = 0;
		
		public function Static() 
		{
			//size set
			this.height = 100;
			this.width = 100;
			
			//determine x and y location
			if (determineLocation >= 0 && determineLocation < .99)
			{
				this.x = 800 / 4;
				this.y = 700 / 3;
			}
			else if (determineLocation >= .99 && determineLocation < 1.99)
			{
				this.x = 800 / 4;
				this.y = 2 * 700 / 3;
			}
			else if (determineLocation >= 1.99 && determineLocation < 2.99)
			{
				this.x = 3 * 800 / 4;
				this.y = 700 / 3;
			}
			else
			{
				this.x = 3 * 800 / 4;
				this.y = 2 * 700 / 3;
			}
			
			addEventListener(MouseEvent.MOUSE_OVER, staticClick);
		}
		
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.MOUSE_OVER, staticClick); 
			 
		}//end of dispose()
		
		public function updateStatic():void 
		{ 
			this.rotation++;
			timerTicks++;
			if (timerTicks >= 3 * 60)
			{
				isDead = true;
			}
		}//end updateStatic()
		
		private function staticClick(e:MouseEvent):void 
		{ 
			isClicked = true;
			isDead = true;
			 
		}//end staticClick() 
	}
	
}
