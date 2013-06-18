package com.deskchairtapioca.blong
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.*;
	import com.deskchairtapioca.blong.Input;
	import flash.geom.Rectangle;
	
	
	[SWF(backgroundColor="0x000000",frameRate="60",width="1280",height="720")]
	
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class Main extends Sprite 
	{
		protected var lastTime:Date = new Date();
		protected var input:Input;
		protected var objectList:Vector.<GameObject> = new Vector.<GameObject>;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//initialize the input
			input= new Input();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, input.OnKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, input.OnKeyUp);
			
			//initialize the game
			var game:Game = new Game(stage,objectList);
			stage.addEventListener(Event.ENTER_FRAME, Update);
			//stage.addEventListener(Event.ENTER_FRAME, EventTest);
			
			
		}
		
		//Update is called every frame to transmit the data necessary to update for that frame
		protected function Update(event:Event):void
		{
			//delta is the integer number of milliseconds since Update was last called for the previous frame
			//TO DO: is there no simple way to get floating point precision for delta?
			var currentTime:Date = new Date();
			var delta:Number = currentTime.getTime() - lastTime.getTime();
			lastTime = new Date();
			//trace(int(1/delta*1000));
			
			stage.dispatchEvent(new UpdateFrameEvent(UpdateFrameEvent.UPDATE_FRAME, delta, input.pressedKeys, objectList));
			
			//dispatch the event from every child of the stage
			//will not loop through children of children
			for (var i:uint = 0; i < stage.numChildren; i++) 
			{
				//TO DO: make sure the events aren't coming back to the stage on every iteration
				stage.getChildAt(i).dispatchEvent(new UpdateFrameEvent(UpdateFrameEvent.UPDATE_FRAME, delta, input.pressedKeys, objectList));
			}
		}
		
		private function EventTest(event:Event):void
		{
			trace("this can test for particular events on the stage for my own edification");
		}
		
	}
	
}