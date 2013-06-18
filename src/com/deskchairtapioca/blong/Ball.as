package com.deskchairtapioca.blong 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class Ball extends GameObject 
	{
		
		public function Ball() 
		{
			graphics.clear();
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, 10, 10);
			graphics.endFill();
			
			this.moveSpeed = 1 / 2;
			this.moveDirection.x = -0.25
			this.moveDirection.y = +1;
			
			addEventListener(UpdateFrameEvent.UPDATE_FRAME, BallUpdate)
		}
		
		protected function BallUpdate(updateFrameEvent:UpdateFrameEvent):void
		{
			this.moveFactor = 1;
			
			//calculate the ball's position in the next frame
			var futurePosition:Rectangle = this.getRect(stage);
			futurePosition.x += this.moveFactor * this.moveDirection.x * (this.moveSpeed * updateFrameEvent.delta);
			futurePosition.y += this.moveFactor * this.moveDirection.y * (this.moveSpeed * updateFrameEvent.delta);
			
			for each (var object:GameObject in updateFrameEvent.objectList)
			{
				//collisions where the intersection will not stop the ball from moving
				if (this == object)
				{
					continue
				}
				
				//if the two rectangles will intersect, prevent movement
				//this may leave a visible gap between the objects since moveFactor can only be 1 or 0
				if (futurePosition.intersects(object.getRect(stage)))
				{
					this.moveFactor = 0;
					this.OnCollide();
				}
			}
			
			this.x += this.moveFactor * this.moveDirection.x * (this.moveSpeed * updateFrameEvent.delta);
			this.y += this.moveFactor * this.moveDirection.y * (this.moveSpeed * updateFrameEvent.delta);
		}
		
		protected function OnCollide():void
		{
			this.moveDirection.x *= -1;
			this.moveDirection.y *= -1;
			//this.moveSpeed *= 1.1
		}
		
	}

}