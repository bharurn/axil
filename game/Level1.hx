package game;

import nme.Lib;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.TextEvent;
import flash.media.SoundChannel;
import flash.text.TextField;
import flash.text.TextFormat;
import game.Base;
                                
class Level1
{
		public var bgmSoundChannel:SoundChannel;
		public var engine:Base;
		
		public function new(s:Stage) 
		{
			engine = new Base(s, 600, 450, 1);
	
			var platx:Array<Int> = [600,625,650,675,279,304,329,354,379,404,429,
							   329,354,379,304,329,354,379,404,429,454,359,379,404,190,630,329,354,379,404,429,454,
							   140,165,185,650,675,700,382,382,382,382,382,382,382,382];
			var platy:Array<Int> = [540,540,540,540,470,470,470,470,470,470,470,
							   390,390,390,300,300,300,300,300,300,300,200,200,200,200,200,150,150,150,150,150,150,
							   100,100,100,100,100,100,220,232,242,253,264,275,286,297];
			
			var spikex:Array<Int> = [344,359,374,389,404,404,425,450,475,379,354];
			var spikey:Array<Int> = [430,430,430,430,430,190,190,190,190,190,190];
		
			engine.crtground(platx,platy);
			engine.crtspiketurned(spikex,spikey);
			engine.crtend(168, 65, 677, 75);
			//engine.d_debug();
		}
		 
}
