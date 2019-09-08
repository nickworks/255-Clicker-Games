package dagd.breu { 
	 
	import flash.display.MovieClip; 
	import flash.events.MouseEvent; 
	 
	 
	 
	public class bubble extends MovieClip  
	{ 
		 
		var travelUp:Boolean = true; 
		var startYLocation:Number; 
		var isDead:Boolean = false; 
		 
		public function bubble() { 
			 
			this.width = 100; 
			this.height = 100; 
			 
			this.x = 0 - this.width; 
			 
			this.y = Math.random() * 600; 
			this.y += 52; 
			 
			startYLocation = this.y; 
			 
			if (Math.random() >= 0.5) 
			{ 
				travelUp = false;
			} 
			 
			addEventListener(MouseEvent.CLICK, bubbleClick); 
 
		}//end bubble() 
		 
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.CLICK, bubbleClick); 
			 
		}//end of dispose() 
 
		 
		public function updateBubble() 
		{ 
			//controls x movement 
			this.x += 4; 
 
			//controls y movement 
			edgeCheck(); 
			 
			if (travelUp == false) 
			{ 
				this.y += 4;
			} 
			else 
			{ 
				this.y -= 4;
			} 
			 
			//kills if off screen 
			if(this.x > 800 + this.width)//checks if off right side of screen 
			{ 
				isDead = true; 
			} 

		}//end updateBubble() 
		 
		public function edgeCheck():void 
		{ 
			if (this.y <= startYLocation - this.height || this.y <= 52 + this.height/2) 
			{ 
				travelUp = false; 
				 
				
			} 
			else if (this.y >= startYLocation + this.height || this.y >= 700 - this.height/2) 
			{ 
				travelUp = true; 
 

			} 
			else{}
		}//end edggeCheck() 
		 
		private function bubbleClick(e:MouseEvent):void 
		{ 
 
			trace("Good"); 
			isDead = true; 
			 
		}//end bubbleClick 
		 
	} 
}
		 