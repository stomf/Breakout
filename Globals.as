package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Tomf
	 */
	public class Globals 
	{
		
		public static var DIRECTIONS : Vector.<Point> = new <Point>[new Point(0,-1), new Point(1,0), new Point(0,1), new Point(-1,0)];
				
		public function Globals() 
		{
			
		}
		
		public static function UP() : Point
		{
			return DIRECTIONS[0];
		}

		public static function RIGHT() : Point
		{
			return DIRECTIONS[1];
		}

		public static function DOWN() : Point
		{
			return DIRECTIONS[2];
		}
		public static function LEFT() : Point
		{
			return DIRECTIONS[3];
		}

		
	}

}