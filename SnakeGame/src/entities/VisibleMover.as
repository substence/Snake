package entities
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import graphix.SnakeGraphic;
	
	import grid.Grid;
	import grid.GridCollisionEvent;
	import grid.Node;
	
	import interfaces.ISpatial;
	
	public class VisibleMover extends EventDispatcher implements ISpatial
	{
		public var position:Point;
		public var graphic:DisplayObject;
		protected var _node:Node;
		
		public function VisibleMover(graphic:DisplayObject = null, position:Point = null)
		{
			if (!position)
				position = new Point();
			this.position = position;
			this.graphic = graphic;
		}
		
		public function get node():Node
		{
			return _node;
		}

		public function set node(value:Node):void
		{
			if (value == _node)
				return;
			//I no longer occupy my old node
			if (_node && _node.occupant == this)
				_node.occupant = null;
			_node = value;
			//If im setting it to null then don't do the rest.
			if (!_node)
				return;
			//if the node is already occupied, collide with it.
			if (_node.occupant)
				dispatchEvent(new GridCollisionEvent(GridCollisionEvent.COLLIDE, this, _node.occupant, _node));
			_node.occupant = this;
		}

		public function update():void
		{
			node = Grid.getNodeAtPoint(position);
			graphic.x = Grid.getPositionFromNode(node).x;
			graphic.y = Grid.getPositionFromNode(node).y;
		}
	}
}