package ui
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import users.User;

	public class PlayingUI extends Sprite
	{
		public static const TITLE_CLICKED:String = "titleClicked";
		public var scoreText:TextField;
		public var titleText:TextField;
		private var _director:SnakeGame;
		
		public function PlayingUI(director:SnakeGame)
		{
			_director = director;
			scoreText = new TextField();
			titleText = new TextField();
			titleText.x = _director.stage.stageWidth * .4;
			titleText.y = _director.stage.stageHeight * .4;
			addChild(scoreText);
			addChild(titleText);
			titleText.text = "Click me to start";
			titleText.addEventListener(MouseEvent.CLICK, onTitleClick);
			_director.addEventListener(SnakeGame.GAME_OVER, onGameOver);
			_director.user.addEventListener(User.SCORE_UPDATED, updateScoreText);
			updateScoreText();
		}
		
		protected function onTitleClick(event:MouseEvent):void
		{
			dispatchEvent(new Event(TITLE_CLICKED));
			titleText.visible = false;
			updateScoreText();
		}
		
		private function updateScoreText(event:Event = null):void
		{
			scoreText.text = "Score: " + _director.user.score;
		}
		
		private function onGameOver(event:Event):void
		{
			titleText.text = "Game Over\n(Click me to restart)";
			titleText.visible = true;
		}
	}
}