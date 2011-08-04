package components
{
	import config.Config;
	
	import entities.VisibleMover;
	
	import flash.display.Stage;
	import flash.geom.Point;
	
	import grid.GridCollisionEvent;

	public class BoundsController
	{
		public var doesWrap:Boolean;
		public var mover:VisibleMover;
		public var stage:Stage;
		
		public function BoundsController(mover:VisibleMover, stage:Stage)
		{
			this.doesWrap = Config.DOES_SNAKE_WRAP;
			this.mover = mover;
			this.stage = stage;
		}
		
		public function update():void
		{
			var position:Point = mover.position;
			var width:uint = stage.stageWidth;
			var height:uint = stage.stageHeight;
			var didCollide:Boolean = false;
			if (position.x < 0)
			{
				position.x = doesWrap ? width : 0;		
				didCollide = true;
			}
			else if (position.x > width)
			{
				position.x = doesWrap ? 0 : width;		
				didCollide = true;
			}
			if (position.y < 0)
			{
				position.y = doesWrap ? height : 0;		
				didCollide = true;
			}
			else if (position.y > height)
			{
				position.y = doesWrap ? 0 : height;
				didCollide = true;
			}
			if (didCollide && !doesWrap)
				mover.dispatchEvent(new GridCollisionEvent(GridCollisionEvent.COLLIDE, mover));
		}
	}
}