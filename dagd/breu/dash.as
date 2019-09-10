package dagd.breu { 
	 
	import flash.display.MovieClip; 
	import flash.events.MouseEvent; 
	 
	 
	public class dash extends MovieClip { 
		 
		var isDead:Boolean = false 
		 
		public function dash()  
		{ 
			// constructor code 
			this.width = 300; 
			this.height = 50; 
			 
			this.x = 0 - this.width; 
						 
			this.y = Math.random() * 600; 
			this.y += 52; 
			 
			addEventListener(MouseEvent.CLICK, dashClick); 
		}//end dash() 
		 
		public function dispose():void//clean up left over event listeners 
		{ 
			 
			removeEventListener(MouseEvent.CLICK, dashClick); 
			 
		}//end of dispose() 
		 
		public function updateDash():void 
		{ 
			this.x += 8;
		}//end updateDash() 
		 
		private function dashClick(e:MouseEvent):void 
		{ 
 
			trace("Bad"); 
			 
		}//end dashclick() 
	} 
	 
} 
