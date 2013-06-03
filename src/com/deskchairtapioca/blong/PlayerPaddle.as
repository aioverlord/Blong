package com.deskchairtapioca.blong 
{
	import flash.ui.Keyboard;
	
	/**
	 * Player controlled paddle.
	 * The update is simply based on keyboard input.
	 * @author Gleb Vorobjev
	 */
	public class PlayerPaddle extends GameObject 
	{
		//movement speed in pixels per millisecond
		protected static const MOVE_SPEED:Number = 1/5;
		
		public function PlayerPaddle() 
		{
			addEventListener(UpdateFrameEvent.UPDATE_FRAME, PlayerPaddleUpdate)
		}
		
		public function PlayerPaddleUpdate(customEvent:UpdateFrameEvent):void
		{
			if (customEvent.pressedKeys[Keyboard.W] || customEvent.pressedKeys[Keyboard.UP])
			{
				this.y -= MOVE_SPEED * customEvent.delta;
			}
			if (customEvent.pressedKeys[Keyboard.S] || customEvent.pressedKeys[Keyboard.DOWN])
			{
				this.y += MOVE_SPEED * customEvent.delta;
			}
			
		}
		
	}

}