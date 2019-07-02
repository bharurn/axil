package game;

import box2D.dynamics.B2World;
import flash.display.Bitmap;
import flash.display.Stage;
import nme.Lib;
import game.Base;
    /**
	 * @author Bharath Raghavan(BR)
	 * Axil Game Level 2
	 */                             

class Level2
{
	
	public var engine:Base;
	public function new(s:Stage) 
	{
		
		engine = new Base(s, 40, 40, 2);
			
			
		var platx:Array<Int> = [10, 35,  60, 85,110,
							   10, 35, 60, 85,110,
							   10, 35, 60, 85, 110,
							   110,110,110,110,110,110,110,110,110,110,110,110,110,110,
							   110,110,110,110,110,
							   160,
							   210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,210,
							   210,210,210,210,210,210,210,210,
							   235,260,285,310,335,
							   570];
			
		var platy:Array<Int> = [100,100,100,100,100,
							   400,400,400,400,400,
							   250,250,250,250,250,
							   110,122,134,146,158,170,182,194,206,218,230,242,262,274,
							   350,362,374,386,398,
							   530,
							   10, 22, 34, 46, 58, 70, 82, 94,106,118,130,142,154,166,178,190,202,214,226,238,250,262,274,286,298,310,322,
							   530,518,506,494,482,470,458,446,
							   446,446,446,446,446,
							   300];
			
		var spiketurnedx:Array<Int> = [90,60,30];
		var spiketurnedy:Array<Int> = [290,290,290];
			
		var spikex:Array<Int> = [300,315];
		var spikey:Array<Int> = [415,415];
		
		//for the rotated platform
		var plata:Bitmap = new Bitmap( util.Util.loadImage ("Lib/img/platform.png") );
		engine.st.addChild(plata);
		plata.x = 357;	
		plata.y = 446;	
		plata.width = 100;
		plata.height = 10;
		plata.rotation = 22;	
		engine.CreateBox(plata.x, plata.y+11, 84, 14, false,1,.5,false,"",.9,45);
				
		engine.crtground(platx,platy);
		engine.crtspiketurned(spiketurnedx,spiketurnedy);
		engine.crtspike(spikex,spikey);
		engine.crtend(50, 373, 600, 165);
		//engine.d_debug();
	}
		 
}
