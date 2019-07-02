package game;

import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
import flash.display.Bitmap;
import util.Util;
	
	/**
	 * @author Bharath Raghavan(BR)
	 * Axil Game Level 6
	 */
	
class Level6 
{
	public var engine:Base;
	private var spikb:Array<Bitmap>;
	private var spikb_box:Array<Dynamic>;
	private var dir:String;
	public function new(s:Stage) 
	{
		
		engine = new Base(s,40,40,6);
		engine.crtend(265,440,730,230);
		dir = "up";
		
		spikb = new Array();
		spikb_box = new Array();
		
		var plattx:Array<Int> = [90,160,280,340,420,320];
		
		var platty:Array<Int> = [100,120,170,250,370,410];
		
		var platx:Array<Int> = new Array(); 
		var platy:Array<Int> = new Array();
		
		var i:Int =0;
		
		for (i in 0...3) {
			if (i == 0) platx[i] = 240;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 480;
		}
		
		for (i in 3...10) {
			if (i ==3) platx[i] = 630;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 270;
		}
		
		engine.crtroundground(plattx, platty);
		engine.crtground(platx,platy);
		//engine.d_debug();
		i = 0;
		var lim:Int = 20;
		while(i<lim){spikb.push(new Bitmap(Util.loadImage("Lib/img/spike.png")));i++;}
		for(i in 0...lim)
		{
			if(i==0)spikb[i].x = 17;	
			else spikb[i].x = spikb[i-1].x+15;
			spikb[i].y = 410;
			spikb[i].width = 15;
			spikb[i].height = 30;
			engine.st.addChild(spikb[i]);
			spikb_box.push(engine.CreateBox(spikb[i].x, spikb[i].y, 15, 10, false,1,0,false,"spike"));
		}
		engine.st.addEventListener(Event.ENTER_FRAME, Movespik);
	}
		 
	private function Movespik(e:Event){
		var i:Int;
		if (spikb[0].y >= 400 && !(spikb[0].y < 100)) {	
			dir = "up";
		}else if (spikb[0].y < 100 && !(spikb[0].y >= 400)) {	
			dir = "down";
		}
			
		if (dir == "up" && !engine.pause) {
			for(i in 0...20){
				spikb[i].y -= 3.5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}else if( dir == "down" && !engine.pause) {
			for(i in 0...20){
				spikb[i].y += 5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}
	}
	
}