package dagd.petzak {
	
	import flash.geom.ColorTransform;
	
	public class MiniFish extends GoodFish {
		
		public var origin:int = 0; // initial y location
		
		public function MiniFish(xloc:int, yloc:int, color:int) {		
			x = xloc + (Math.floor(Math.random() * 30));
			y = yloc;
			points = 10;
			speed = Math.floor(Math.random() * 2) + 2 // 2 to 4
			
			setColor(color);			
			origin = yloc;	
		}						
		
		public function setColor(color:int):void {
			var obj_color:ColorTransform = new ColorTransform();
			// applying the transform to our movieclip (this will affect the whole object including strokes)
			if (color == 0) {
				obj_color.color = 0xff0000; // r
				nudge = -84;
			}
			else if (color == 1) {
				obj_color.color = 0xffb700; // o
				nudge = -56;
			}
			else if (color == 2) {
				nudge = -28;
				obj_color.color = 0xffff00; // y
			}
			else if (color == 3) {
				obj_color.color = 0x2bff00; // g
			}
			else if (color == 4) {
				nudge = 28;
				obj_color.color = 0x0066ff; // b
			}
			else if (color == 5) {
				nudge = 56;
				obj_color.color = 0x1500b5; // i
			}
			else if (color == 6) {
				nudge = 84;
				obj_color.color = 0x6200ff; // v
			}
			this.transform.colorTransform = obj_color;
		}
		
		public function update():void {	
			// shift the fish nudge spaces away from inital y position
			if (y != origin + nudge) {
				
				if (nudge < 0)
					y -= 2;
				else
					y += 2;
			}
			
			x -= speed; // move to the left three pixels
						
			if (x < -20) // checks if off left side of screen
				isDead = true;
		} // ends update
	}	
}
