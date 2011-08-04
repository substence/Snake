package graphix
{
	import flash.display.Sprite;
	
	import grid.Grid;
	import grid.Node;
	
	public class GridGraphic extends Sprite
	{
		public function GridGraphic()
		{
			update();
		}
		
		public function update():void
		{
			graphics.clear();
			for(var i:int = 0; i < Grid.columns; i++)
			{
				for(var j:int = 0; j < Grid.rows; j++)
				{
					var node:Node = Grid.getNodeAt(i, j);
					graphics.lineStyle(1, 0, .05);
/*					if (node.occupant)
						graphics.beginFill(0);*/					
					graphics.drawRect(i * Grid.GRID_SIZE, j *  Grid.GRID_SIZE,  Grid.GRID_SIZE,  Grid.GRID_SIZE);
					graphics.endFill();				
				}
			}
		}
	}
}