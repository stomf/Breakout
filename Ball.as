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
		private var size : Point;
		private var minYDist : Number;
		private var minXDist : Number;
		
		public function Ball (parent : DisplayObjectContainer) 
		{
			location = new Point (40, 40);
			heading = new Point (10.1, 3.7123);
			size = new Point (5.0, 5.0);

			clip = new BallClip();
			parent.addChild(clip);
			update();
		}
		
		private function update() : void
		{
			clip.x = location.x;
			clip.y = location.y;
		}
		
		public function moveBall() : void
		{
			location.x += heading.x;
			location.y += heading.y;
			update();
		}
		
		public function checkCollisions(surfaces : Vector.<Surface>) : void
		{
			var vHit : Boolean = false;
			var hHit : Boolean = false;
			minYDist = 100 * heading.y;
			minXDist = 100 * heading.x;
			
			for each (var s : Surface in surfaces)
			{
				if (s.getFacing() == Globals.UP() && heading.y > 0)
				{
					if (checkBounceUp(s))
					{
						vHit = true;
					};
				}
				if (s.getFacing() == Globals.DOWN() && heading.y < 0)
				{
					if (checkBounceDown(s))
					{
						vHit = true;
					};
				}
				if (s.getFacing() == Globals.LEFT() && heading.x > 0)
				{
					if (checkBounceLeft(s))
					{
						hHit = true;
					};
				}
				if (s.getFacing() == Globals.RIGHT() && heading.x < 0)
				{
					if (checkBounceRight(s))
					{
						hHit = true;
					};
				}
			}
			
			if (vHit)
			{
				heading.y = -heading.y;
				location.y -= minYDist;
			}
			if (hHit)
			{
				heading.x = -heading.x;
				location.x -= minXDist;
			}

		}
		
		private function checkBounceUp(s : Surface) : Boolean
		{
			var yDist : Number = s.getP1().y - size.y - location.y;
			
			if (yDist > 0 && yDist <= heading.y)
			{
				var spercent : Number = yDist / heading.y;
				var xPoint : Number = location.x + (heading.x * spercent);
				if (xPoint > s.getMinX() && xPoint < s.getMaxX())
				{
					s.ding();
					minYDist = Math.min(yDist, minYDist);
					return true;
				}
			}
			return false;
		}
		
		private function checkBounceDown(s : Surface) : Boolean
		{
			var yDist : Number = s.getP1().y + size.y - location.y;
			
			if (yDist < 0 && yDist >= heading.y)
			{
				var spercent : Number = -yDist / heading.y;
				var xPoint : Number = location.x + (heading.x * spercent);
				if (xPoint > s.getMinX() && xPoint < s.getMaxX())
				{
					s.ding();
					minYDist = Math.max(yDist, minYDist);
					return true;
				}
			}
			return false;
		}
		
		private function checkBounceLeft(s : Surface) : Boolean
		{
			var xDist : Number = s.getP1().x - size.x - location.x;
			
			if (xDist > 0 && xDist <= heading.x)
			{
				var spercent : Number = xDist / heading.x;
				var yPoint : Number = location.y + (heading.y * spercent);
				if (yPoint > s.getMinY() && yPoint < s.getMaxY())
				{
					s.ding();
					minXDist = Math.min(xDist, minXDist);
					return true;
				}
			}
			return false;
		}
		
		private function checkBounceRight(s : Surface) : Boolean
		{
			var xDist : Number = s.getP1().x + size.x - location.x;
			
			if (xDist < 0 && xDist >= heading.x)
			{
				var spercent : Number = -xDist / heading.x;
				var yPoint : Number = location.y + (heading.y * spercent);
				if (yPoint > s.getMinY() && yPoint < s.getMaxY())
				{
					s.ding();
					minXDist = Math.max(xDist, minXDist);
					return true;
				}
			}
			return false;
		}
		
	}
	
}