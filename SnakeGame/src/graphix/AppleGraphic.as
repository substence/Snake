package graphix
{
	import flash.display.Sprite;
	
	import grid.Grid;
	
	public class AppleGraphic extends Sprite
	{
		public function AppleGraphic(color:uint = 0xFF0000, diameter:uint = 0,  alpha:Number = 1)
		{
			if (diameter == 0)
				diameter = Grid.GRID_SIZE;
			graphics.beginFill(color);
			var radius:Number = diameter * .5;
			graphics.drawCircle(radius, radius, radius);
			graphics.endFill();
			this.alpha = alpha;
		}
	}
}