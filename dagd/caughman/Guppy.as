package dagd.caughman  {

	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Guppy extends MovieClip {
		
		private var velocityX:Number = 0;
		private var velocityY:Number = 0;
		
		public var isDead:Boolean = false;		
		public var points:Number = 0;
		
		public function Guppy() {
			
			x= 400;
			y= 300;
			
			velocityX = Math.random()*4+1;
			velocityY = Math.random()* 5-2.5;
			
			addEventListener(MouseEvent.MOUSE_DOWN, click);
		}//End compiler
		
		private function click(e:MouseEvent):void{
				isDead =true;//reference to the game that it should be removed from the game
				points=100;
			}//End Click
			
			public function update():void {
			x++;
			//euler integration
			
			x+= velocityX;
			y+= velocityY;
			
			if(x>600) isDead=true;//kills it off screne
		}//End Update
		
		public function dispose():void{
			removeEventListener(MouseEvent.MOUSE_DOWN,click);
		}//End Dispose
	}
	
}
