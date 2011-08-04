package grid
{
	import config.Config;
	
	import entities.VisibleMover;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.geom.Point;
	
	import interfaces.ISpatial;
	
	public class Grid extends EventDispatcher
	{
		public static const GRID_SIZE:uint = Config.GRID_CELL_SIZE;
		public static var columns:uint = 20;
		public static var rows:uint = 15;
		private static var _nodes:Vector.<Vector.<Node>>;
		
		public function Grid(stage:Stage)
		{
			createGrid(stage.stageWidth, stage.stageHeight);
		}
		
		private function createGrid(width:uint, height:uint):void
		{			
			columns = width / GRID_SIZE;
			rows = height / GRID_SIZE;
			_nodes = new Vector.<Vector.<Node>>();
			for(var i:int = 0; i < columns; i++)
			{
				_nodes[i] = new Vector.<Node>();
				for(var j:int = 0; j < rows; j++)
				{
					_nodes[i][j] = new Node(i, j);
				}
			}			
		}
		
/*		public static function setNodeOccupant(node:Node, occupant:VisibleMover):void
		{
			if (node.occupant == occupant)
				return;
			if (node.occupant)
				occupant.dispatchEvent(new GridCollisionEvent(GridCollisionEvent.COLLIDE, node.occupant, occupant, node));
			node.occupant = occupant;
		}*/
		
		public static function getNodeAt(x:uint, y:uint):Node
		{
			x = x < 0 ? 0 : x;
			y = y < 0 ? 0 : y;		
			y = y >= rows ? rows - 1 : y;
			x = x >= columns ? columns - 1 : x;		
			return _nodes[x][y];
		}
		
		public static function getRandomUnoccupiedNode():Node
		{
			var node:Node;
			do 
			{
				node = _nodes[Math.floor(Math.random() * columns)][Math.floor(Math.random() * rows)];
			} while(node.occupant != null);
			return node;
		}
		
		public static function getNodeAtPoint(point:Point):Node
		{
			var x:int = Math.floor(point.x / GRID_SIZE);
			var y:int = Math.floor(point.y / GRID_SIZE);			
			return getNodeAt(x,y);
		}
		
		public static function getPositionFromNode(node:Node):Point
		{
			var x:int = Math.floor(node.x * GRID_SIZE);
			var y:int = Math.floor(node.y * GRID_SIZE);			
			return new Point(x, y);
		}
	}
}