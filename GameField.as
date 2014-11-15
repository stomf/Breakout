package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	
	/**
	 * ...
	 * @author Tomf
	 */
	public class GameField 
	{
		private var stageRef : DisplayObjectContainer;
		private var mainClip : MovieClip;
		
		public function GameField(stage : Stage) : void
		{
			stageRef = stage;
			
			mainClip = new GameClip;
			stage.addChild(mainClip);
		}
	}
	
}