package dagd.core {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * Extend this class to make simple text-based menu systems.
	 * Each menu is currently laid out vertically and navigated with UP and DOWN arrow keys.
	 * You can customize how the menu looks by setting any of the protected properties or by
	 * overriding the drawCursor() and drawField() methods.
	 */
	public class Menu extends MovieClip {

		/** The x-position of the textfields. */
		protected var offsetX:int = 100;
		/** The y-posiyion of the textfields. */
		protected var offsetY:int = 100;
		/** The amount of space between each menu option. */
		protected var spacing:int = 80;
		
		protected var options:Vector.<Button> = new Vector.<Button>();
		
		/**
		 * Adds an option to the menu.
		 * @bttn	The button to add to the menu.
		 */
		public function addOption(bttn:Button):void {
			bttn.x = offsetX;
			bttn.y = offsetY + options.length * spacing;
			options.push(bttn);
			addChild(bttn);
			
		}
	}
}
