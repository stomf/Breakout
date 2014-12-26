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
		private var mainClip : Border;
		private var ball : Ball;
		private var surfaces : Vector.<Surface>;
		
		public function GameField(stage : Stage) : void
		{
			stageRef = stage;
			
			surfaces = new Vector.<Surface>();
			
			mainClip = new Border;
			stage.addChild(mainClip.getClip());
			declareWalls();
			
			ball = new Ball(mainClip.getClip());
			addBrick();
			
			stageRef.addEventListener(Event.ENTER_FRAME, eachFrame);		
		}
		
		private function declareWalls()
		{
			mainClip.declareSurfaces(surfaces);
		}
		
		private function eachFrame(e : Event) : void
		{
			ball.checkCollisions(surfaces);
			ball.moveBall();
		}
		
		private function addBrick() : void
		{
			for (var i : int = 0; i < 80; i++)
			{
				
				var b : Brick = new Brick(Math.floor(Math.random()*15), Math.floor(Math.random()*28), mainClip.getClip());
				b.declareSurfaces(surfaces);
				
			}
			
			trace (surfaces.length);
			
		}
	}
	
}