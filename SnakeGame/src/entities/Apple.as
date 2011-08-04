package entities
{
	import graphix.AppleGraphic;

	public class Apple extends VisibleMover
	{
		public var worth:uint = 10;
		public var foodWorth:uint = 2;
		
		public function Apple()
		{
			super(new AppleGraphic());
		}
	}
}