package dagd.core {
	
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	
	
	public class ButtonMenuPause extends Button {
		
		public var speed:Number = -10;
		private var caption:String = "";
		
		public function ButtonMenuPause(caption:String = "", func:Function = null) {
			
			super(func);
			this.caption = caption;
			redraw();
		}
		public function slideLeftTo(targetX:Number):Boolean {
			x += speed;
			if(x < targetX) {
				x = targetX;
				speed = 0;
				return true;
			}
			speed -= 1;
			return false;
		}
		override protected function redraw():void {
			super.redraw();
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.text = caption;
		}
	}
}
