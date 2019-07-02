package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
import util.Util;
                                 
class Level13
{
	public var engine:Base;
	var spikb:Array<Bitmap>;
	var spikb_box:Array<B2Body>;
	private var lock_box:B2Body;
	private var lock:Bitmap;
	
	private var dir:String;
	private var stps:Int;
	
	private var created:Bool;
		
	public function new(s:Stage) 
	{
			
		engine = new Base(s, 50, 10, 13);
		
		spikb = new Array();
		spikb_box = new Array();
		
		lock = new Bitmap(Util.loadImage("Lib/img/door.png"));
			
		var platx:Array<Int> = new Array();
			
		var platy:Array<Int> = new Array();
		
		dir = "down";
		stps = 0;
		
		created = false;
		
		var i:Int;
		for (i in 0...6) {
			if (i == 0) platx[i] = 20;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 90;
		}
		
		for (i in 6...8) {
			if (i == 6) platx[i] = 560;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 290;
		}
		
		for (i in 8...14) {
			if (i == 8) platx[i] = 590;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 520;
		}
		
		for (i in 14...19) {
			if (i == 14) platx[i] = 700;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 420;
		}
		
		
		engine.crtground(platx,platy);
		engine.crtend(230,260,550,85);
		engine.crtswitch(460, 490);
		engine.crtspikeswing([250], [300]);
		
		//engine.d_debug();
			
		engine.st.addChild(lock);
		lock.width = 10;
		lock.height = 90;
		lock.x = 420;
		lock.y = 440;
			
		lock_box = engine.CreateBox(lock.x, lock.y, lock.width, lock.height, false,1,0, true, "lock",0);
			
		var i:Int = 0;
		var wih:Int =15;
		
		while(i<3){spikb.push(new Bitmap(util.Util.loadImage("Lib/img/spike.png"))) ;i++;}
		for(i in 0...3)
		{
			spikb[i].rotation = 180;
			if(i==0)spikb[i].x = 550;	
			else spikb[i].x = spikb[i-1].x+wih;
			spikb[i].y = 50;
			spikb[i].width = 15;
			spikb[i].height = 30;
			engine.st.addChild(spikb[i]);
			spikb_box.push(engine.CreateBox(spikb[i].x-15, spikb[i].y, 15, 10, false,1,0,false,"spike"));
		}
		engine.st.addEventListener(Event.ENTER_FRAME, Movespik);
	}
	private function Movespik(e:Event){
		var i:Int;
		if(stps<120 && !engine.pause){	
			if (dir == "down") {	for(i in 0...3)spikb[i].y += 2;  }
			else if(dir == "up"){	for(i in 0...3) spikb[i].y -= 2;	}
			stps++;
			for(i in 0...3) spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
		}else if(stps >= 120 && !engine.pause){
			if (dir == "down") { dir = "up";	}
			else if(dir == "up"){ dir = "down";	}
			stps = 0;
		}
		
		if(engine.switch_on){
			for(i in 0...53){
				engine.st.removeChild(lock);
				lock_box.setPosition(new B2Vec2( -30, -30));
				if (!created) {
					engine.crtgun([600], [460], [1]);
					created = true;
				}
			}
		}
	}
}