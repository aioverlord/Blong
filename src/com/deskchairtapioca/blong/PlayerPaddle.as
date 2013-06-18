package com.deskchairtapioca.blong 
{
	import flash.ui.Keyboard;
	
	/**
	 * Player controlled paddle.
	 * The update is simply based on keyboard input.
	 * @author Gleb Vorobjev
	 */
	public class PlayerPaddle extends Paddle 
	{
		
		public function PlayerPaddle() 
		{
			addEventListener(UpdateFrameEvent.UPDATE_FRAME, PlayerPaddleUpdate)
		}
		
		public function PlayerPaddleUpdate(updateFrameEvent:UpdateFrameEvent):void
		{
			
				if (updateFrameEvent.pressedKeys[Keyboard.W] || updateFrameEvent.pressedKeys[Keyboard.UP])
				{
					this.moveDirection.y = -1;
					this.AttemptMovePaddle(updateFrameEvent);
					this.moveDirection.y = 0;
				}
				if (updateFrameEvent.pressedKeys[Keyboard.S] || updateFrameEvent.pressedKeys[Keyboard.DOWN])
				{
					this.moveDirection.y = +1;
					this.AttemptMovePaddle(updateFrameEvent);
					this.moveDirection.y = 0;
				}
			
				//trace(this.getRect(stage));
		}
		
		
	}

}