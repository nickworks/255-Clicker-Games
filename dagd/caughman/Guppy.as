package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Guppy extends MovieClip {
		
		private var velocityX:Number = 0;
		private var velocityY:Number = 0;
		
		public var isDead:Boolean = false;		
		public var points:Number = 0;
		
		public function Guppy() {
			
			x= -20;
			y= 400;
			
			velocityX = 50;
			velocityY = 0;
			
			addEventListener(MouseEvent.MOUSE_DOWN, click);
		}//End compiler
		
		private function click(e:MouseEvent):void{
				isDead =true;//reference to the game that it should be removed from the game
				points=100;
			}//End Click
			
			public function update():void {
			y++;
			//euler integration
			var gravity:Number =1;
			
			velocityY+= gravity;
			
			x+= velocityX;
			y+= velocityY;
			
			if(y>400) isDead=true;//kills it off screne
		}//End Update
		
		public function dispose():void{
			removeEventListener(MouseEvent.MOUSE_DOWN,click);
		}//End Dispose
	}
	
}
