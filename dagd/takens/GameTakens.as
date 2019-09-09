package dagd.takens {

	import dagd.core.Game;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Mouse;
	import dagd.takens.Cow;
	import dagd.takens.UFO;

	public class GameTakens extends Game {

		private var ufo:UFO = new UFO;
		private var cows:Array = new Array();
		
		public function GameTakens() {
			gameTitle = "Xtraterrestrial";
			creatorName = "Keith Takens";
			init();
		}
		
		public function init() {
			addChild(ufo);
			ufo.mouseEnabled = false;
			addEventListener(Event.ENTER_FRAME, gameLoop);
			//Mouse.hide();
			
		}
		
		private function gameLoop(e: Event): void {
			
			//I would have these be in the ufo class, but it messes up the location due to local space
			ufo.x = mouseX;
			ufo.y = mouseY;
			spawnCow();
		}
		
		private function spawnCow(){
			
			for(var x = 0;x<cows.length;x++){
				cows[x].update();
				if(cows[x].isDead){
					removeChild(cows[x]);
					cows[x].dispose();
					cows.removeAt(x);
				}
			}
			
			var chance:int = Math.random() * 100;
			if(chance < 2){
					var c:Cow = new Cow;
					cows.push(c);
					addChild(c);
					setChildIndex(c, 0);
					var side = Math.random()* 10;
					var xvelocity = (Math.random() * 2) + 2;
					if(side<=5){
						c.x = -10;
						c.velocityX = xvelocity;
					}
					else {
						c.x = 800;
						c.velocityX = -xvelocity;
						c.scaleX = -c.scaleX;
					}
					//c.x = Math.random() * 800;
					c.y = Math.random() * 700;
					c.velocityY = Math.random() * 3;
				}
			//math.rand
		}
		
	}
}