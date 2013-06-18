package com.deskchairtapioca.blong 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class Paddle extends GameObject 
	{
		
		public function Paddle() 
		{
			graphics.clear();
			graphics.beginFill(0x00FFFF);
			graphics.drawRect(0, 0, 75, 150);
			graphics.endFill();
			
			//movement speed in pixels per millisecond
			this.moveSpeed = 1/2;
		}
		
		protected function AttemptMovePaddle(updateFrameEvent:UpdateFrameEvent):void
		{
			this.moveFactor = 1;
			
			this.CollidePaddle(updateFrameEvent);
			
			this.y += this.moveFactor * this.moveDirection.y * (this.moveSpeed * updateFrameEvent.delta);
		}
		
		protected function CollidePaddle(updateFrameEvent:UpdateFrameEvent):void
		{
			for each (var object:GameObject in updateFrameEvent.objectList)
			{
				//collisions where the intersection will not stop the paddle from moving
				//TO DO: add collision with ball here
				if (this == object)
				{
					continue
				}
				
				//calculate the paddle's position in the next frame
				var futurePosition:Rectangle = this.getRect(stage);
				futurePosition.y += this.moveFactor * this.moveDirection.y * (this.moveSpeed * updateFrameEvent.delta);
				
				//if the two rectangles will intersect, prevent movement
				//this may leave a visible gap between the objects since moveFactor can only be 1 or 0
				if (futurePosition.intersects(object.getRect(stage)))
				{
					this.moveFactor = 0;
				}
			}
		}
		
	}

}