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
		
	}

}