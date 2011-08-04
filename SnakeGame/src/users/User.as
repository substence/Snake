package users
{
	import components.BoundsController;
	import components.KeyboardMovement;
	
	import entities.Snake;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class User extends EventDispatcher
	{
		public static var SCORE_UPDATED:String = "scoreUpdated";
		public var leftKey:uint = Keyboard.LEFT;
		public var righttKey:uint = Keyboard.RIGHT;
		public var upKey:uint = Keyboard.UP;
		public var downKey:uint = Keyboard.DOWN;
		public var snake:Snake;
		private var _score:uint = 0;
		
		public function User(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			snake = new Snake();
			snake.boundsController = new BoundsController(snake, stage);
			new KeyboardMovement(this, snake);	//no cleanup so no need to store this
		}
		
		public function get score():uint
		{
			return _score;
		}

		public function set score(value:uint):void
		{
			_score = value;
			dispatchEvent(new Event(SCORE_UPDATED));
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