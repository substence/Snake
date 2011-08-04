package users
{
	import entities.Snake;
	
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class User extends EventDispatcher
	{
		public var leftKey:uint = Keyboard.LEFT;
		public var righttKey:uint = Keyboard.RIGHT;
		public var upKey:uint = Keyboard.UP;
		public var downKey:uint = Keyboard.DOWN;
		public var score:uint = 0;
		public var snake:Snake;
		
		public function User(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
		}
		
		protected function onKeyPress(event:KeyboardEvent):void
		{
			dispatchEvent(event);//echo
		}
		
		public function update():void
		{
			if (snake)
				snake.update();
		}
	}
}