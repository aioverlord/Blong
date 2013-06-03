package com.deskchairtapioca.blong 
{
	import flash.events.KeyboardEvent;
	/**
	 * Currently Input keeps track of what keys are pressed down at any given moment.
	 * TO DO: add mouse interaction.
	 * pressedKeys is passed to objects via the UpdateFrameEvent
	 * @author Gleb Vorobjev
	 */
	public class Input 
	{
		protected const MAX_KEY:int = 128;
		public var pressedKeys:Vector.<Boolean>;
		
		public function Input() 
		{
			pressedKeys = new Vector.<Boolean>(MAX_KEY);
		}
		
		public function OnKeyDown(event:KeyboardEvent):void
		{
			pressedKeys[event.keyCode] = true;
		}
		
		public function OnKeyUp(event:KeyboardEvent):void
		{
			pressedKeys[event.keyCode] = false;
		}
	}

}