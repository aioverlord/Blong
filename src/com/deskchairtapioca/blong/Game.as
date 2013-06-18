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
		
		public function Game(stage:Stage,objectList:Vector.<GameObject>) 
		{
			/*//test music goes here temporarily
			[Embed(source = "../../../../lib/paralysis_of_analysis.mp3")]
			var MySound:Class; 		 
			var sound:Sound; 
			sound = (new MySound) as Sound; 			     
			sound.play(); */
			
			var ball1:Ball = new Ball();
			stage.addChild(ball1);
			ball1.x = 700;
			ball1.y = 350;
			
			var paddle1:PlayerPaddle = new PlayerPaddle();
			stage.addChild(paddle1);
			paddle1.x = 100;
			paddle1.y = 350;
			objectList.push(paddle1);
			
			
			var testBlock:GameObject = new GameObject();
			stage.addChild(testBlock);
			testBlock.x = 100;
			testBlock.y = 10;
			objectList.push(testBlock);
			
			var paddle2:PlayerPaddle = new PlayerPaddle();
			stage.addChild(paddle2);
			paddle2.x = 300;
			paddle2.y = 350;
			objectList.push(paddle2);
			
			var upperWall:Wall = new Wall();
			stage.addChild(upperWall);
			objectList.push(upperWall);
			
			var lowerWall:Wall = new Wall();
			stage.addChild(lowerWall);
			lowerWall.y = 710;
			objectList.push(lowerWall);
			
		}
		
		
		
	}


}