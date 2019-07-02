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
	 * Axil Game Level 11
	 */
	
class Level11 
{
	public var engine:Base;
	private var spikb:Array<Bitmap>;
	private var spikb_box:Array<Dynamic>;
	private var dir:String;
	public function new(s:Stage) 
	{
		
		engine = new Base(s,280,40,11);
		engine.crtend(19,440,395,320);
		dir = "down";
		
		spikb = new Array();
		spikb_box = new Array();
		
		var platx:Array<Int> = new Array(); 
		var platy:Array<Int> = new Array();
		
		var i:Int =0;
		
		
		for (i in 0...30) {
			if (i == 0) platy[i] = 150;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 200;
		}
		
		for (i in 30...33) {
			if (i ==30) platx[i] = 110;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 150;
		}
		
		for (i in 33...62) {
			if (i == 33) platy[i] = 175;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 105;
		}
		
		for (i in 62...95) {
			if (i == 62) platy[i] = 125;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 350;
		}
		
		for (i in 95...98) {
			if (i == 95) platx[i] = 350;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 125;
		}
		
		for (i in 98...102) {
			if (i ==98) platx[i] = 350;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 310;
		}
		
		engine.crtroundground([590], [450]);
		engine.crtground(platx, platy);
		engine.crtspikeswing([600], [150]);
		engine.crtgun([230, 365, 230, 365], [210, 330, 410, 490], [0, 1, 0, 1]);
		engine.crtspike([400, 415], [280, 280]);
		//engine.d_debug();
		i = 0;
		var lim:Int = 3;
		while(i<lim){spikb.push(new Bitmap(Util.loadImage("Lib/img/spike.png")));i++;}
		for(i in 0...lim)
		{
			if(i==0)spikb[i].x = 17;	
			else spikb[i].x = spikb[i-1].x+15;
			spikb[i].y = 410;
			spikb[i].width = 15;
			spikb[i].height = 30;
			spikb[i].rotation = 180;
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
			for(i in 0...3){
				if(!engine.pause)spikb[i].y -= 3.5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}else if( dir == "down" && !engine.pause) {
			for(i in 0...3){
				if(!engine.pause)spikb[i].y += 5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}
	}
	
}