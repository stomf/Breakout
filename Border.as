package  
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Tomf
	 */
	public class Border implements GameObject 
	{
		private var clip : MovieClip;
		
		public function Border() 
		{
			clip = new GameClip();
		}
		
		public function declareSurfaces(surfaces :  Vector.<Surface>) : void
		{		
			var topWall : Surface = new Surface(new Point(10, 10), new Point(630, 10), Globals.DOWN(), this);
			surfaces.push(topWall);
			var leftWall : Surface = new Surface(new Point(10, 10), new Point(10, 470), Globals.RIGHT(), this);
			surfaces.push(leftWall);
			var rightWall : Surface = new Surface(new Point(630, 10), new Point(630, 470), Globals.LEFT(), this);
			surfaces.push(rightWall);
			var bottomWall : Surface = new Surface(new Point(10, 470), new Point(630, 470), Globals.UP(), this);
			surfaces.push(bottomWall);
		}
		
		public function getClip() : MovieClip
		{
			return clip;
		}
		
		/* INTERFACE GameObject */
		
		public function eachFrame():void 
		{
			
		}
		
		public function ding(facing:Point):void 
		{
			
		}
		
	}

}