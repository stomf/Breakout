package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tomf
	 */
	public class GameField 
	{
		private var stageRef : DisplayObjectContainer;
		private var mainClip : MovieClip;
		private var ball : Ball;
		
		public function GameField(stage : Stage) : void
		{
			stageRef = stage;
			
			mainClip = new GameClip;
			stage.addChild(mainClip);
			
			ball = new Ball(mainClip);
			
			stageRef.addEventListener(Event.ENTER_FRAME, eachFrame);
		}
		
		private function eachFrame(e : Event) : void
		{
			ball.moveBall();
		}
	}
	
}