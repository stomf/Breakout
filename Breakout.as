package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	/**
	 * ...
	 * @author tom fraser (curiousGaming)
	 */
	public class Breakout extends MovieClip 
	{
		
		
		public function Breakout() : void
		{
			stage.showDefaultContextMenu = false;
			stage.focus = stage;
			stage.stageFocusRect = false;
		}
		
		public function begin() : void
		{
			new GameField(stage);
		}
	} //end class
}