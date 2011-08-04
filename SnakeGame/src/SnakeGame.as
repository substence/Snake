package
{
	import entities.Apple;
	import entities.Snake;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import grid.Grid;
	import grid.GridCollisionEvent;
	
	import interfaces.ISpatial;
	
	import users.User;
	
	public class SnakeGame extends Sprite
	{
		private var _user:User;
		private var _grid:Grid;
		private var _apple:Apple;
		private var _isPaused:Boolean;
		
		public function SnakeGame()
		{
			_apple = new Apple();
			_grid = new Grid();
			_user = new User(stage);
			_user.snake = new Snake(_user);
			_isPaused = false;
			stage.addChild(_user.snake.graphic);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			_grid.addEventListener(GridCollisionEvent.COLLIDE, onGridCollision);
			reset();
		}
		
		protected function onGridCollision(event:GridCollisionEvent):void
		{
			if (event.collider is Snake)
			{
				var collidee:ISpatial = event.collidee;
				if (collidee is Apple)
					onSnakeAndAppleCollision();
				else if (collidee  is Snake)
					onSnakeAndSnakeCollision();
			}
		}
		
		private function reset():void
		{
			setRandomApplePosition();
			_user.score = 0;
			_user.snake.length = 1;
			_user.snake.position = new Point(stage.stageWidth * .5, stage.stageHeight * .5);
		}
		
		private function onSnakeAndAppleCollision():void
		{
			_user.score += 10;
			_user.snake.length += 1;
			setRandomApplePosition();
		}
		
		private function onSnakeAndSnakeCollision():void
		{
			reset();
			_isPaused = true;
		}
		
		private function setRandomApplePosition():void
		{
			//_apple.position = _grid.getRandomUnoccupiedNode();
		}
		
		protected function onEnterFrame(event:Event):void
		{
			if (_isPaused)
				return;
			_user.update();
		}
	}
}