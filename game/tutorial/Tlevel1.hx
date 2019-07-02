package game.tutorial;

import nme.Lib;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.TextEvent;
import flash.media.SoundChannel;
import flash.text.TextField;
import flash.text.TextFormat;
import game.Base;
                                
class Tlevel1
{
		public var engine:Base;
		var txt:TextField;
		var txt2:TextField;
		var txt3:TextField;
		var txt4:TextField;
	
		public function new(s:Stage) 
		{
			engine = new Base(s, 70, 400, -1);
			
			txt = new TextField();
			txt2 = new TextField();
			txt3 = new TextField();
			txt4 = new TextField();
			
			var txtfrm:TextFormat = new TextFormat();
			txtfrm.size = 18;
			txt.width = 400;
			txt.height = 300;			
			
			txt.text = ">USE THE LEFT/RIGHT \nARROW KEYS TO MOVE . \n\n>USE THE SPACEBAR TO \nJUMP. \n\n>TO GET A HIGHER \nJUMP HOLD SPACEBAR FOR SOMETIME." ;
			engine.st.addChild(txt);
			txt.x = 10;
			txt.y = 210;
			txt.setTextFormat(txtfrm);
			
			txt2.text = ">Be CAREFUL OF THE SPIKES!!.THEY CAN KILL YOU" ;
			engine.st.addChild(txt2);
			txt2.x = 40;
			txt2.y = 520;
			txt2.width = 600;
			txt2.setTextFormat(txtfrm);
			
			txt3.text = ">YOU CAN CLING TO THE SIDES OF THE PLATFORM\nBY HOLDING THE ARROW KEYS.\n\nTO CLIMB UP WHILE CLINGING USE THE SPACEBAR." ;
			engine.st.addChild(txt3);
			txt3.x = 350;
			txt3.y = 270;
			txt3.width = 600;
			txt3.setTextFormat(txtfrm);
			
			txt4.text = ">COLLECT BOTH BLUE AND RED ORBS TO WIN." ;
			engine.st.addChild(txt4);
			txt4.x = 300;
			txt4.y = 100;
			txt4.width = 500;
			txt4.setTextFormat(txtfrm);
			
			var platx:Array<Int> = [75,150,270,400];
			var platy:Array<Int> = [500,400,300,420];
		
			engine.crtground(platx,platy);
			engine.crtend(270, 250, 400, 360);
			//engine.d_debug();
		}
		 
}
