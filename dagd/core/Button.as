package dagd.core {
	
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	
	
	public class Button extends MovieClip {

		public var func:Function;
		private var hover:Boolean = false;
		
		public function Button(func:Function = null) {
			stop();
			this.func = func;
			
			buttonMode = true;
			mouseChildren = false;
			mouseEnabled = true;
			
			addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OVER, handleMouseOver, false, 0, true);
			addEventListener(MouseEvent.MOUSE_OUT , handleMouseOut , false, 0, true);
			redraw();
		}
		protected function handleMouseDown(e:MouseEvent):void {
			if(func != null) func();
		}
		protected function handleMouseOver(e:MouseEvent):void {
			hover = true;
			redraw();
		}
		protected function handleMouseOut(e:MouseEvent):void {
			hover = false;
			redraw();
		}
		protected function redraw():void {
			gotoAndStop(hover ? 2 : 1);
		}

	}
	
}
