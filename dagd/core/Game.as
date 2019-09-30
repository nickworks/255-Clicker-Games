package dagd.core {
	import flash.display.MovieClip;

	/**
	 * This is the abstract base class for all Scenes.
	 */
	public class Game extends MovieClip {

		public var gameTitle:String = "Superfun Game";
		public var creatorName:String = "...";
		public var bannerImage:Class = null;
		
		/**
		 * This method is called when the Scene is loaded and in the scene graph.
		 * Override this method and use it as an initializer.
		 */
		public function onStart():void {}
		/**
		 * This method is called when the Scene is removed from the scene graph
		 * and about to be destroyed.
		 * Override this method and use it to dispose any necessary data.
		 */
		public function onEnd():void {}
	}
}
