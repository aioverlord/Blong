package com.deskchairtapioca.blong
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class GameObject extends Sprite
	{
		//this is just filler for now, collision stuff will go here
		public function GameObject() 
		{
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, 100, 300);
			graphics.endFill();
		}
		
	}
	

}