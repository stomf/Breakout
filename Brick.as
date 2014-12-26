package  
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Tomf
	 */
	public class Brick implements GameObject 
	{
		private var fx : int;
		private var fy : int;
		protected var clip : MovieClip;
		
		public function Brick(fieldX : int, fieldY : int, parent : DisplayObjectContainer) 
		{
			//I want bricks to have a standard size so it is easier to draw fields of bricks.
			//My field space is 620x460
			//So if my bricks are 40x16
			//My brick field is 15 bricks wide and 28 bricks high
			
			clip = new BrickClip();
			fx = fieldX;
			fy = fieldY;
			
			clip.x = fx * 40 + 10;
			clip.y = fy * 16 + 10;
			parent.addChild(clip);
			clip.gotoAndStop(1);
		}
		
		public function declareSurfaces(surfaces :  Vector.<Surface>) : void
		{		
			var topEdge : Surface = new Surface(new Point(fx * 40 + 10, fy * 16 + 10), new Point(fx * 40 + 50, fy * 16 + 10), Globals.UP(), this);
			surfaces.push(topEdge);
			var leftEdge : Surface = new Surface(new Point(fx * 40 + 10, fy * 16 + 10), new Point(fx * 40 + 10, fy * 16 + 26), Globals.LEFT(), this);
			surfaces.push(leftEdge);
			var rightEdge : Surface = new Surface(new Point(fx * 40 + 50, fy * 16 + 10), new Point(fx * 40 + 50, fy * 16 + 26), Globals.RIGHT(), this);
			surfaces.push(rightEdge);
			var bottomEdge : Surface = new Surface(new Point(fx * 40 + 10, fy * 16 + 26), new Point(fx * 40 + 50, fy * 16 + 26), Globals.DOWN(), this);
			surfaces.push(bottomEdge);	
		}
		
		/* INTERFACE GameObject */
		
		public function eachFrame():void 
		{
			//do nothing
			//bricks don't move.
		}
		
		public function ding(facing : Point) : void
		{
			clip.gotoAndStop((clip.currentFrame % 5) + 1);
		}
		
	}

}