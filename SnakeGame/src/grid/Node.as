package grid
{
	import entities.VisibleMover;
	
	import interfaces.ISpatial;

	public class Node
	{
		public var x:int;
		public var y:int;
		public var occupant:ISpatial;
		
		public function Node(x:uint, y:uint)
		{
			this.x = x;
			this.y = y;
		}
	}
}