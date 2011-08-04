package entities
{
	import components.KeyboardMovement;
	
	import flash.geom.Point;
	
	import users.User;

	public class Snake extends VisibleMover
	{
		public var direction:Point;
		public var previousPositions:Vector.<Point>;
		public var speed:Number;
		protected var _length:uint;
		protected var _keyboardMovement:KeyboardMovement;
		
		public function Snake(user:User, position:Point = null)
		{
			super(position);
			speed = 1;
			direction = new Point(0,-1);
			previousPositions = new Vector.<Point>();
			length = 1;
			_keyboardMovement = new KeyboardMovement(user, this);	//keep track of this for cleanup
		}
		
		public function get length():uint
		{
			return _length;
		}

		public function set length(value:uint):void
		{
			_length = value;
			previousPositions.length = value;
		}

		public function update():void
		{
			var velocity:Point = new Point(direction.x * speed, direction.y * speed)
			position = position.add(velocity);
			//
			graphic.x = position.x;
			graphic.y = position.y;
		}
	}
}