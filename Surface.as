package  
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author Tomf
	 */
	public class Surface 
	{
		private var p1 : Point;
		private var p2 : Point;
		private var facing : Point;
		
		public function Surface(p1 : Point, p2 : Point, facing : Point) 
		{
			this.p1 = new Point (p1.x, p1.y);
			this.p2 = new Point (p2.x, p2.y);
			this.facing = facing;
			
			if (facing.y == 0) //vertical surface
			{
				if (p1.x != p2.x)
				{
					throw new Error("Invalid vertical surface");
				}
			}
			if (facing.x == 0) //horizontal surface
			{
				if (p1.y != p2.y)
				{
					throw new Error("Invalid horizontal surface");
				}
			}
			
		}
		
		public function ding() : void
		{
			//something hit this surface.
		}
		
		public function getFacing() : Point
		{
			return facing;
		}
		
		public function getP1() : Point
		{
			return p1;
		}
		
		public function getP2() : Point
		{
			return p2;
		}
		
		public function getMinX() : Number
		{
			return Math.min(p1.x, p2.x);
		}

		public function getMinY() : Number
		{
			return Math.min(p1.y, p2.y);
		}

		public function getMaxX() : Number
		{
			return Math.max(p1.x, p2.x);
		}

		public function getMaxY() : Number
		{
			return Math.max(p1.y, p2.y);
		}

	}

}