package entities
{
	import graphix.AppleGraphic;

	public class Apple extends VisibleMover
	{
		//score
		public var worth:uint = 5;
		//how much it extends the snake
		public var foodWorth:uint = 4;
		
		public function Apple()
		{
			super(new AppleGraphic());
		}
	}
}