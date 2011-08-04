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
			_snake.direction = direction;
		}
	}
}