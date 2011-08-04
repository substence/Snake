package grid
{
	import flash.events.Event;
	
	import interfaces.ISpatial;
	
	public class GridCollisionEvent extends Event
	{
		public static const COLLIDE:String = "gridCollisionCollide";
		public var collider:ISpatial;
		public var collidee:ISpatial;
		public var node:Node;
		
		public function GridCollisionEvent(type:String, collider:ISpatial, collidee:ISpatial = null, node:Node = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.collidee = collidee;
			this.collider = collider;
			this.node = node;
			super(type, bubbles, cancelable);
		}
	}
}