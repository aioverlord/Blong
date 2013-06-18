package com.deskchairtapioca.blong
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class GameObject extends Sprite
	{
		//default movement speed in pixels per millisecond
		protected var moveSpeed:Number = 0;
		//default multiplier of movement speed
		protected var moveFactor:Number = 0;
		protected var moveDirection:Point = new Point(0, 0);
		
		public function GameObject() 
		{
			graphics.beginFill(0xFFFFFF,0.5);
			graphics.drawRect(0, 0, 75, 150);
			graphics.endFill();
		}
		
		
	}
	

}