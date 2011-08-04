package entities
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import graphix.SnakeGraphic;
	
	import interfaces.ISpatial;
	
	public class VisibleMover implements ISpatial
	{
		public var position:Point;
		public var graphic:DisplayObject;
		
		public function VisibleMover(position:Point = null)
		{
			if (!position)
				position = new Point();
			this.position = position;
			graphic = new SnakeGraphic();
		}
	}
}