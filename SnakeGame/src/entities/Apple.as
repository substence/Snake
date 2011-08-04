package entities
{
	import graphix.AppleGraphic;

	public class Apple extends VisibleMover
	{
		//score
		public var worth:uint = 10;
		//how much it extends the snake
		public var foodWorth:uint = 2;
		
		public function Apple()
		{
			super(new AppleGraphic());
		}
	}
}