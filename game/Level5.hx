package game;

import flash.display.Sprite;
import flash.display.Stage;
import game.Base;
                                 
class Level5 
{
	public var engine:Base;
		
	public function new(s:Stage) 
	{
			
		engine = new Base(s,40,40,5);
			
		var plattx:Array<Int> = [40,160,280,600,555,450,340,260,200,130,160,200,10,60];
			
		var platty:Array<Int> = [100,120,170,400,360,400,320,240,450,500,400,450,420,400];
			
		var platx:Array<Int> = new Array(); var platy:Array<Int> = new Array();
			
		var i:Int;
			
		for (i in 0...3) {
			if (i == 0) platx[i] = 20;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 250;
		}
			
		for (i in 3...5) {
			if (i ==3) platx[i] = 700;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 270;
		}
			
		engine.crtgun([30,730,30,730,275],[270,390,450,490,190],[0,1,0,1,0]);
			
		engine.crtroundground(plattx, platty);
		engine.crtground(platx, platy);
		engine.crtend(80, 510, 720, 200);
		//engine.d_debug();
	}
}