package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
import util.Util;
                                 
class Level3
{
	public var engine:Base;
	var spikb:Array<Bitmap>;
	var spikb_box:Array<B2Body>;
	private var lock_box:B2Body;
	private var lock:Bitmap;
	private var lock2_box:B2Body;
	private var lock2:Bitmap;
		
	public function new(s:Stage) 
	{
			
		engine = new Base(s, 90, 200, 3);
		
		spikb = new Array();
		spikb_box = new Array();
		
		lock = new Bitmap(Util.loadImage("Lib/img/door.png"));
		lock2 = new Bitmap(Util.loadImage("Lib/img/door.png"));
			
		var platx:Array<Int> = [550,575,600,625,
							   450,425,400,375,350,325,
							   240,215,190,165,
							   450,425,400,375,350,325,
							   550,
							   360,
							   750,725,700,675,650,625,600,575,550,525,500,
							   450,
							   270,
							   350,375,400,425,450,475,500,525,
							   300,
							   220];
			
		var platy:Array<Int> = [530,530,530,530,
							   530,530,530,530,530,530,
							   530,530,530,530,
							   420,420,420,420,420,420,
							   390,
							   320,
							   280,280,280,280,280,280,280,280,280,280,280,
							   200,
							   150,
							   130,130,130,130,130,130,130,130,
							   230,
							   310];
		
		engine.crtground(platx,platy);
		engine.crtend(400,500,550,85);
		engine.crtswitch(450, 90);
		
		//engine.d_debug();
			
		engine.st.addChild(lock);
		lock.width = 10;
		lock.height = 90;
		lock.x = 460;
		lock.y = 440;
			
		lock_box = engine.CreateBox(lock.x, lock.y, lock.width, lock.height, false,1,0, true, "lock",0);
			
		engine.st.addChild(lock2);
		lock2.width = 10;
		lock2.height = 90;
		lock2.x = 330;
		lock2.y = 440;
			
		lock2_box = engine.CreateBox(lock2.x, lock2.y, lock2.width, lock2.height, false,1,0, true, "lock",0);
		
		var i:Int = 0;
		var lim:Int = 53;
		var wih:Int =15;
		
		while(i<lim){spikb.push(new Bitmap(util.Util.loadImage("Lib/img/spike.png"))) ;i++;}
		for(i in 0...lim)
		{
			spikb[i].rotation = 180;
			if(i==0)spikb[i].x = 17;	
			else spikb[i].x = spikb[i-1].x+wih;
			spikb[i].y = 35;
			spikb[i].width = 15;
			spikb[i].height = 30;
			engine.st.addChild(spikb[i]);
			spikb_box.push(engine.CreateBox(spikb[i].x-15, spikb[i].y, 15, 10, false,1,0,false,"spike"));
		}
		engine.st.addEventListener(Event.ENTER_FRAME, Movespik);
	}
	private function Movespik(e:Event){
		var i:Int;
		if(engine.switch_on && !engine.pause){
			engine.st.removeChild(lock);
			lock_box.setPosition(new B2Vec2(-30,-30));
				
			engine.st.removeChild(lock2);
			lock2_box.setPosition(new B2Vec2( -30, -30));
			for(i in 0...53){				
				spikb[i].y += 0.5;
				spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));
				
			}
		}
	}
}