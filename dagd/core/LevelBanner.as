package dagd.core {
	import flash.display.MovieClip;
	
	public class LevelBanner extends MovieClip {
		
		private var yShow:Number = 0;
		private var yHide:Number = 0;
		private var shouldShow:Boolean = false;
		
		public function LevelBanner() {
			yShow = 0;
			yHide = -height;
			this.y = yHide;
			changeText("", "");
			
			bttnPlay.visible = false;
			
			bttnPause.func = function(){
				App.main.showPauseMenu();
			};
			bttnPlay.func = function(){
				App.main.hidePauseMenu();
			};
			
		}
		public function changeText(game:String, name:String):void {
			textTitle.text = game;
			textName.text = name;
		}

		public function update(shouldShow:Boolean):void {
			
			bttnPlay.visible = App.main.isPaused;
			bttnPause.visible = !App.main.isPaused;
			var yTarget:Number = (shouldShow) ? yShow : yHide;
			y += (yTarget - y) * 0.16;
		}
	}
}
