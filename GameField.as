package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Tomf
	 */
	public class GameField 
	{
		private var stageRef : DisplayObjectContainer;
		private var mainClip : MovieClip;
		private var ball : Ball;
		private var surfaces : Vector.<Surface>;
		
		public function GameField(stage : Stage) : void
		{
			stageRef = stage;
			
			surfaces = new Vector.<Surface>();
			declareWalls();
			mainClip = new GameClip;
			stage.addChild(mainClip);
			
			ball = new Ball(mainClip);
			
			stageRef.addEventListener(Event.ENTER_FRAME, eachFrame);		
		}
		
		private function declareWalls()
		{
			var topWall : Surface = new Surface(new Point(10, 10), new Point(630, 10), Globals.DOWN());
			surfaces.push(topWall);
			var leftWall : Surface = new Surface(new Point(10, 10), new Point(10, 470), Globals.RIGHT());
			surfaces.push(leftWall);
			var rightWall : Surface = new Surface(new Point(630, 10), new Point(630, 470), Globals.LEFT());
			surfaces.push(rightWall);
			var bottomWall : Surface = new Surface(new Point(10, 470), new Point(630, 470), Globals.UP());
			surfaces.push(bottomWall);
		}
		
		private function eachFrame(e : Event) : void
		{
			ball.checkCollisions(surfaces);
			ball.moveBall();
		}
	}
	
}