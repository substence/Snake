package components
{
	import entities.Snake;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	import users.User;

	public class KeyboardMovement
	{
		private var _user:User;
		private var _snake:Snake;
		
		public function KeyboardMovement(user:User, snake:Snake)
		{
			_user = user;
			_snake = snake;
			_user.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		protected function onKeyDown(event:KeyboardEvent):void
		{
			var direction:Point = new Point();
			switch(event.keyCode)
			{
				case _user.leftKey:
				{
					direction.x =-1;
					break;
				}
				case _user.righttKey:
				{
					direction.x = 1;
					break;
				}
				case _user.upKey:
				{
					direction.y =-1;
					break;
				}
				case _user.downKey:
				{
					direction.y = 1;
					break;
				}
			}
			//if your desired direction is the opposite of your current direction, ignore you (you cant go backwards)
			if (direction.equals(new Point(_snake.direction.x * -1, _snake.direction.y * -1)))
				return;
			_snake.direction = direction;
		}
	}
}