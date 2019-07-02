package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import game.Base;
	
/**
 * ...
 * @author Bharath Raghavan (BR)
 * Axil Game Level 8
 * Created on 1-11-2011
 */
class Level8  
{
	public var engine:Base;
	var spikb:Array<Bitmap>;
	var spikb_box:Array<B2Body>;
	private var lock_box:B2Body;
	private var lock:Bitmap;
	var dir:String;
	
	public function new(s:Stage) 
	{
		engine = new Base(s, 40, 40, 8);
		
		lock = new Bitmap(util.Util.loadImage("Lib/img/door.png"));
		
		dir = "up";
		
		spikb = new Array();
		spikb_box = new Array();
			
		var platx:Array<Int> = new Array(); var platy:Array<Int> = new Array();
		var i:Int = 0;
		for (i in 0...3) {
			if (i == 0) platx[i] = 10;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 100;
		}
			
		for (i in 3...6) {
			if (i == 3) platx[i] = 160;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 280;
		}
			
		for (i in 6...8) {
			if (i == 6) platx[i] = 10;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 370;
		}
			
		for (i in 8...16) {
			if (i == 8) platx[i] = 10;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 450;
		}
			
		for (i in 16...37) {
			platx[i] = 240;
			if (i == 16) platy[i] = 220;
			else platy[i] = platy[i - 1] + 12;
		}
			
		for (i in 37...47) {
			if (i == 37) platx[i] = 90;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 550;
		}
			
		for (i in 47...50) {
			if (i == 47) platx[i] = 300;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 180;
		}
			
		for (i in 50...53) {
			if (i == 50) platx[i] = 420;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 130;
		}
			
		for (i in 53...56) {
			if (i == 53) platx[i] = 540;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 100;
		}
			
		for (i in 56...59) {
			if (i == 56) platx[i] = 700;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 100;
		}
			
		for (i in 59...62) {
			if (i == 59) platx[i] = 500;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 210;
		}
			
		for (i in 62...65) {
			if (i == 62) platx[i] = 600;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 260;
		}
			
		for (i in 65...68) {
			if (i == 65) platx[i] = 500;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 300;
		}
			
		for (i in 68...71) {
			if (i == 68) platx[i] = 400;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 360;
		}
			
		for (i in 71...73) {
			if (i == 71) platx[i] = 360;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 450;
		}

		engine.crtground(platx, platy);
		//engine.d_debug();
		engine.crtspikeswing([195], [100]);
		engine.crtswitch(730,60);
		engine.crtend(150, 500, 20, 320);
		engine.crtgun([700],[350],[1]);
		
		var lim:Int = 3;
		i = 0;
		while(i<lim){spikb.push(new Bitmap(util.Util.loadImage("Lib/img/spike.png")));i++;}
		for(i in 0...lim)
		{
			if(i==0)spikb[i].x = 650;	
			else spikb[i].x = spikb[i-1].x+15;
			spikb[i].y = 160;
			spikb[i].width = 15;
			spikb[i].height = 30;
			engine.st.addChild(spikb[i]);
			spikb_box.push(engine.CreateBox(spikb[i].x, spikb[i].y, 15, 10, false,1,0,false,"spike"));
		}
		
		engine.st.addChild(lock);
		lock.width = 11;
		lock.height = 80;
		lock.x = 190;
		lock.y = 470;
		
		lock_box = engine.CreateBox(lock.x, lock.y, lock.width, lock.height, false, 1, 0, true, "lock", 0);
			
		engine.st.addEventListener(Event.ENTER_FRAME, Movespik);
		
	}
		
	private function Movespik(e:Event){
		var i:Int;
		if (spikb[0].y >= 150 && !(spikb[0].y < 20) ) {	
			dir = "up";
		}
		else if (spikb[0].y < 20 && !(spikb[0].y >= 150)) {	
			dir = "down";
		}
		
		if (dir == "up" && !engine.pause) {
			for(i in 0...3){
				spikb[i].y -= 1;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}else if( dir == "down" && !engine.pause) {
			for(i in 0...3){
				spikb[i].y += 1.5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
			}
		}
		
		if(engine.switch_on){
			engine.st.removeChild(lock);
			lock_box.setPosition(new B2Vec2(-30,-30));
		}
	}
		
}