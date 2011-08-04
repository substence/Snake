package graphix
{
	import flash.display.Sprite;
	
	import grid.Grid;
	
	public class SnakeGraphic extends Sprite
	{
		public function SnakeGraphic(color:uint = 0xFF0000, size:uint = 0,  alpha:Number = 1)
		{
			if (size == 0)
				size = Grid.SIZE;
			graphics.beginFill(color);
			graphics.drawRect(0, 0, size, size);
			graphics.endFill();
			this.alpha = alpha;
		}
	}
}