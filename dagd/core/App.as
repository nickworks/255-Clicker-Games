package dagd.core {
	
	import flash.display.Stage;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.InteractiveObject;
	import flash.events.FocusEvent;
	import flash.geom.Point;
	
	import flash.utils.*;

	/**
	 * This is the top-most class of our entire game.
	 * It establishes our game loop, sets up the keyboard input,
	 * and runs a scene manager state-machine.
	 */
	public class App extends MovieClip {
		
		public static var main;
		
		/** The current scene. */
		private var game:Game = null;
		private var hasFocus:Boolean = false;
		public var isPaused:Boolean = false;
				
		private var pauseMenu:MenuPause;
		public var levelBanner:LevelBanner;
		
		/**
		 * The constructor for the entire game. Here we setup our game loop and our
		 * Keys singleton.
		 */
		public function App() {
			
			App.main = this;
			addEventListener(Event.ENTER_FRAME, gameLoop); // setup game loop
			setupInactiveOverlay(); // setup screen overlay
			changeGame(new GameLauncher());
		}
		/**
		 * This function sets up the overlay that shows when the game loses focus.
		 */
		private function setupInactiveOverlay():void {
			
			var overlay = new InactiveOverlay();
			addChild(overlay);
			
			stage.addEventListener(Event.ACTIVATE, function(e:Event){
				hasFocus = true;
				overlay.visible = false;
			});
			stage.addEventListener(Event.DEACTIVATE, function(e:Event){
				hasFocus = false;
				overlay.visible = true;
			});
			
			overlay.x = stage.stageWidth/2;
			overlay.y = stage.stageHeight/2;
			overlay.getChildAt(0).width = stage.stageWidth;
			overlay.getChildAt(0).height = stage.stageHeight;
		}
		/**
		 * This event-handler function forms our core game loop.
		 * @param	e	The ENTER_FRAME Event that triggered this method.
		 */
		private function gameLoop(e:Event):void {
			var showBanner:Boolean = (game != null) && !(game is GameLauncher);
			levelBanner.update(showBanner);
		}
		/**
		 * This method manages our state machine for scene management.
		 * If a valid Scene object is passed in, the old scene is removed and
		 * the new scene is added to the scene graph.
		 * @param	newScene	The new scene to switch the state machine to.
		 */
		public function changeGame(newGame:Game):void {

			if(newGame == null) return;
			if(game) {
				game.onEnd();
				removeChild(game);
			}
			
			game = newGame;
			addChildAt(game, 0);
			game.onStart();
			
			levelBanner.changeText(game.gameTitle, game.creatorName);
		}
		public function showPauseMenu():void {
			if(isPaused) return;
			isPaused = true;
			pauseMenu = new MenuPause();
			addChildAt(pauseMenu, getChildIndex(levelBanner));
		}
		public function hidePauseMenu():void {
			if(!isPaused) return;
			isPaused = false;
			if(pauseMenu != null) removeChild(pauseMenu);
			pauseMenu = null;
		}
	}	
}
