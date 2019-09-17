﻿package dagd.wynalda {

	import flash.display.MovieClip;
	import flash.events.MouseEvent;


	public class Snowmobile2 extends MovieClip {
		
		public var isDead:Boolean = false;
		public var points:Number = 0;


		public function Snowmobile2() {
			x = 950;
			y = Math.random() * 700;
			
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick); // can change from MOUSE_DOWN to ROLL_OVER to change it from having to be clicked to just rolling mouse over it

		}
		public function dispose():void{ // this functions job is to perform any cleanup before the object is removed from the game.
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			
		}

		//This function should run every game tick.
		// It dictates the behavior of a Blob object.
		public function update(): void {
			
			x -= 1.5; // move to left 3 pixels
		
			if (x < -10) { // checks if off right side of screen
				isDead = true;
				//x = -150; // moves to left side of screen when it goes off right
			}
		} // public function update
		
		private function handleClick(e: MouseEvent):void {
			isDead = true;
			points = 5;
		}
		
		
	} // public class Blob
} // package code