package com.deskchairtapioca.blong 
{
	import flash.events.Event;
	/**
	 * A custom event which sent on every frame with data to inform objects on how to update.
	 * This event is dispatched in a loop in Main from each direct child of the stage.
	 * The loop is necessary because events normally proceed from children to ancestors, not the other way around.
	 * Each object can have an event listener attached to it which can handle the same data differently.
	 * 
	 * The purpose of this class is to eliminate the need to keep lists of all objects which should update every frame.
	 * @author Gleb Vorobjev
	 */
	public class UpdateFrameEvent extends Event
	{
		public static const UPDATE_FRAME:String = "updateFrame";
		
		public var delta:Number;
		public var pressedKeys:Vector.<Boolean>;
		public var objectList:Vector.<GameObject>;
		
		public function UpdateFrameEvent(type:String, delta:Number, pressedKeys:Vector.<Boolean>, objectList:Vector.<GameObject>, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			//call the superclass Event constructor and then add my data
			super(type, bubbles, cancelable);
			this.delta = delta;
			this.pressedKeys = pressedKeys;
			this.objectList = objectList;
		}
		
		//Allegedly I need to add this when making a custom event class for reasons I don't quite understand
		public override function clone():Event
		{
			return new UpdateFrameEvent(type, this.delta, this.pressedKeys, this.objectList, bubbles, cancelable);
		}
		
	}

}