package dagd.petzak {
	
	import flash.display.MovieClip;	
	
	public class SquidInk extends BadFish {
		
		private var momentum : int = 0;
		
		public function SquidInk(xLoc: int, yLoc: int, m: int) {
			x = xLoc + Math.random() * 60 - 30;
			y = yLoc + Math.random() * 10 + 100;
			momentum = m;
			speed = Math.random() * 8 - 4; // -4 to 4
			damage = 10;
		}
		
		public function update(): void {
			momentum--;
			if (momentum > 0) { // keep moving for 40 to 80 frames
				x += speed; 
				y += Math.random() * 2;
			}
			else { // fade away
				if (alpha > 0){
					alpha -= .1;
				} else {
					isDead = true;
				}
			}
		}
	}	
}
