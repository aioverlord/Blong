package com.deskchairtapioca.blong 
{
	import com.deskchairtapioca.blong.GameObject;
	import com.deskchairtapioca.blong.Input;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.media.Sound;
	
	/**
	 * Creates and sets objects onto the stage.
	 * @author Gleb Vorobjev
	 */
	public class Game
	{
		
		public function Game(stage:Stage) 
		{
			//test music goes here temporarily
			[Embed(source = "../../../../lib/paralysis_of_analysis.mp3")]
			var MySound:Class; 		 
			var sound:Sound; 
			sound = (new MySound) as Sound; 			     
			sound.play(); 
			
			var paddle1:PlayerPaddle = new PlayerPaddle();
			stage.addChild(paddle1);
			paddle1.x = 100;
			
			var paddle2:PlayerPaddle = new PlayerPaddle();
			stage.addChild(paddle2);
			paddle2.x = 300;
			
			
		}
		
		
		
	}


}