package grid
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import interfaces.ISpatial;
	
	public class Grid extends EventDispatcher
	{
		public static const SIZE:uint = 20;
		public static const COLUMNS:uint = 20;
		public static const ROWS:uint = 15;
		private var _nodes:Vector.<Vector.<Node>>;
		
		public function Grid()
		{
			createGrid();
		}
		
		public function setNodeOccupant(node:Node, occupant:ISpatial):void
		{
			if (node.occupant)
				dispatchEvent(new GridCollisionEvent(GridCollisionEvent.COLLIDE, node.occupant, occupant, node));
			node.occupant = occupant;
		}
		
		private function createGrid():void
		{			
			_nodes = new Vector.<Vector.<Node>>();
			for(var i:int = 0; i < COLUMNS; i++)
			{
				_nodes[i] = new Vector.<Node>();
				for(var j:int = 0; j < ROWS; j++)
				{
					_nodes[i][j] = new Node(i, j);
				}
			}			
		}
		
		public function getNodeAt(x:uint, y:uint):Node
		{
			x = x < 0 ? 0 : x;
			y = y < 0 ? 0 : y;		
			y = y >= ROWS ? ROWS - 1 : y;
			x = x >= COLUMNS ? COLUMNS - 1 : x;		
			return _nodes[x][y];
		}
		
		public function getRandomUnoccupiedNode():Node
		{
			var node:Node;
			do 
			{
				node = _nodes[Math.floor(Math.random() * COLUMNS)][Math.floor(Math.random() * ROWS)];
			} while(node.occupant != null);
			return node;
		}
	}
}