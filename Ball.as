package 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Tomf
	 */
	public class Ball 
	{
		private var clip : MovieClip
		private var location : Point;
		private var heading : Point;
		
		public function Ball (parent : DisplayObjectContainer) 
		{
			location = new Point (40, 40);
			heading = new Point (1.0, 10.0);
			
			clip = new BallClip();
			parent.addChild(clip);
			update();
		}
		
		private function update() : void
		{
			clip.x = location.x;
			clip.y = location.y;
		}
	}
	
}