package
{
	import entities.Apple;
	import entities.Snake;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	import graphix.GridGraphic;
	
	import grid.Grid;
	import grid.GridCollisionEvent;
	
	import interfaces.ISpatial;
	
	import ui.PlayingUI;
	
	import users.User;
	
	[SWF(width="800", height="600")]
	public class SnakeGame extends Sprite
	{
		public static const GAME_OVER:String = "gameOver";
		public var user:User;
		private var _grid:Grid;
		private var _ui:PlayingUI;
		private var _apple:Apple;
		private var _isPaused:Boolean;
		
		public function SnakeGame()
		{
			_grid = new Grid(stage);
			user = new User(stage);
			_apple = new Apple();
			_ui = new PlayingUI(this);
			_isPaused = true;
			stage.addChild(new GridGraphic());	//debug
			stage.addChild(user.snake.graphic);
			stage.addChild(_apple.graphic);
			stage.addChild(_ui);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			user.snake.addEventListener(GridCollisionEvent.COLLIDE, onSnakeCollision);
			_ui.addEventListener(PlayingUI.TITLE_CLICKED, onTitleClick);
			reset();
			setRandomApplePosition();
			update();
		}
		
		private function reset():void
		{
			user.score = 0;
			user.snake.length = 0;
			user.snake.direction = new Point(0, -1);
			user.snake.position = new Point(stage.stageWidth * .5, stage.stageHeight);
		}
		
		protected function onTitleClick(event:Event):void
		{
			reset();
			_isPaused = false;
		}
		
		protected function onSnakeCollision(event:GridCollisionEvent):void
		{
			var collidee:ISpatial = event.collidee;
			if (collidee && collidee is Apple)
				onSnakeAndAppleCollision(collidee as Apple);
			else
				onSnakeAndSnakeCollision();
		}
		
		private function onSnakeAndAppleCollision(apple:Apple):void
		{
			user.score += apple.worth;
			user.snake.length += apple.foodWorth;
			setRandomApplePosition();
		}
		
		private function onSnakeAndSnakeCollision():void
		{
			_isPaused = true;
			dispatchEvent(new Event(GAME_OVER));
		}
		
		private function setRandomApplePosition():void
		{
			_apple.position = Grid.getPositionFromNode(Grid.getRandomUnoccupiedNode());
		}
		
		protected function onEnterFrame(event:Event = null):void
		{
			if (_isPaused)
				return;
			update();
		}
		
		public function update():void
		{
			user.update();
			_apple.update();
		}
	}
}