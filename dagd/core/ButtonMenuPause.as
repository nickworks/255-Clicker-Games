package dagd.core {
	
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	
	
	public class ButtonMenuPause extends Button {
		
		private var caption:String = "";
		
		public function ButtonMenuPause(caption:String = "", func:Function = null) {
			
			super(func);
			this.caption = caption;
			redraw();
		}
		override protected function redraw():void {
			super.redraw();
			textField.autoSize = TextFieldAutoSize.RIGHT;
			textField.text = caption;
		}
	}
	
}
