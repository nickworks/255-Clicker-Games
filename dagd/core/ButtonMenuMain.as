package dagd.core {
	
	import flash.display.MovieClip;
	import flash.text.*;
	import flash.events.MouseEvent;
	import flash.display.Bitmap;
	import flash.geom.ColorTransform;
	
	
	public class ButtonMenuMain extends Button {
		
		public var speed:Number = 0;
		public var caption:String = "";
		private var img:Bitmap;
		public var targetX:Number = 0;
		
		public function ButtonMenuMain(caption:String = "", img:Bitmap = null, gameType:Class = null) {
			
			super(function(){
				App.main.changeGame(new gameType());
			});

			if(img != null){
				this.img = img;
				var ratio:Number = img.width/img.height;
				img.smoothing = true;
				img.width = width;
				img.height = width / ratio;
				img.mask = bg2;
				addChildAt(img, getChildIndex(bg2));
			}
			
			textField.autoSize = TextFieldAutoSize.LEFT;
			this.caption = caption;
			redraw();
			
		}
		public function slideToTarget():Boolean {
			if(x > targetX){
				x += speed;
				if(x < targetX) {
					x = targetX;
					speed = 0;
					return true;
				}
				speed -= 1;
			}
			if(x < targetX){
				x += speed;
				if(x > targetX) {
					x = targetX;
					speed = 0;
					return true;
				}
				speed += 1;
			}
			return (x == targetX);
		}
		override protected function redraw():void {
			//super.redraw();
			bg2.visible = false;
			textField.text = caption;
			var tf:TextFormat = textField.defaultTextFormat;
			tf.color = hover ? 0xFFFFFF : 0x666666;
			textField.setTextFormat(tf);
			if(img != null) img.alpha = hover ? .5 : .2;
			
			var ct:ColorTransform = new ColorTransform();
			ct.color = hover ? 0x000000 : 0xEEEEEE;
			bg1.transform.colorTransform = ct;
			
		}
	}
}
