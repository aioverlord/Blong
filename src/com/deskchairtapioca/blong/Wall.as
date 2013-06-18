package com.deskchairtapioca.blong 
{
	/**
	 * ...
	 * @author Gleb Vorobjev
	 */
	public class Wall extends GameObject 
	{
		
		public function Wall() 
		{
			graphics.clear();
			graphics.beginFill(0x00FF00);
			graphics.drawRect(0, 0, 1280, 10);
			graphics.endFill();
		}
		
	}

}