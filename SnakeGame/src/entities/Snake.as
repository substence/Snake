package entities
{
	import components.BoundsController;
	import components.KeyboardMovement;
	
	import config.Config;
	
	import flash.geom.Point;
	
	import graphix.SnakeGraphic;
	
	import grid.Grid;
	import grid.Node;
	
	import users.User;

	public class Snake extends VisibleMover
	{
		public var direction:Point;
		public var trail:Vector.<Snake>;
		public var speed:Number;
		public var boundsController:BoundsController;
		protected var _length:uint;
		
		public function Snake()
		{
			super(new SnakeGraphic());
			speed = Config.SNAKE_SPEED;
			direction = new Point();
			trail = new Vector.<Snake>();
		}
		
		public function get length():uint
		{
			return _length;
		}

		public function set length(value:uint):void
		{
			_length = value;
			if (_length < trail.length) //instantly remove old trial (dont worry about adding new trail, it's done on a as-needed basis)
			{
				for (var i:int = (trail.length - 1) - _length; i >= 0; i--) 
				{
					removeTrailNode(i);
				}
			}
		}
		
		private function removeTrailNode(index:int):void
		{
			var snake:Snake = trail[index];
			graphic.stage.removeChild(snake.graphic);
			snake.node = null;
			trail.splice(index, 1);
		}
		
		private function addTrailNode():Snake
		{
			var snake:Snake = new Snake();
			trail.push(snake);
			graphic.stage.addChild(snake.graphic);
			return snake;
		}
		
		override public function update():void
		{
			var velocity:Point = new Point(direction.x * speed, direction.y * speed)
			position = position.add(velocity);
			if (boundsController)
				boundsController.update();
			updateTrail();
			for (var i:int = 0; i < trail.length; i++) 
			{
				trail[i].update();	
			}
			super.update();
		}
		
		private function updateTrail():void
		{
			//I only need to modify the trail if my new node isnt the same as my last node
			if (trail.length > 0 && _node == trail[trail.length - 1].node)
				return;
			var snake:Snake;
			//if there aren't enough nodes in the trail, add a new one
			if (length > trail.length)
			{
				snake = addTrailNode();
			}
			//else take the last node and move it right behind the snake
			else if (trail.length > 0)
			{
				snake = trail.shift();
				trail.push(snake);
			}
			if (snake && _node)
				snake.position = Grid.getPositionFromNode(_node);
		}
	}
}