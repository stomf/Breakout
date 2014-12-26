package  
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Tomf
	 */
	public interface GameObject 
	{
		function eachFrame() : void;
		function ding(facing : Point) : void;
	}
	
}