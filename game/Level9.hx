package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
import util.Util;
                                 
class Level9
{
	public var engine:Base;
	var spikb:Array<Bitmap>;
	var spikb_box:Array<B2Body>;
	var platr:Bitmap;
	var platr_box:B2Body;
	var stps:Int; 
	var dir:String;
	
	var rpstps:Int; 
	var rpdir:String;	
	public function new(s:Stage) 
	{
			
		engine = new Base(s, 90, 200, 9);
		
		stps = 0;
		dir = "down";
		
		rpstps = 0;
		rpdir = "right";
		
		spikb = new Array();
		spikb_box = new Array();
		
		var platx:Array<Int> = new Array();
			
		var platy:Array<Int> = new Array();
		
		for (i in 0...10) {
			if (i == 0) platx[i] = 10;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 450;
		}
		
		for (i in 10...27) {
			if (i == 10) platy[i] = 250;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 700;
		}
		
		for (i in 27...46) {
			if (i == 27) platy[i] = 100;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 540;
		}
		
		var plattx:Array<Int> = [180];
			
		var platty:Array<Int> = [180];
		
		engine.crtground(platx, platy);
		engine.crtroundground(plattx, platty);
		engine.crtend(50, 50, 700, 110);
		engine.crtspikeswing([410], [170]); 
		
		platr = new Bitmap(Util.loadImage("Lib/img/rnd_platform.png"));
		engine.st.addChild(platr);
		platr.x = 400;
		platr.y = 470;
		platr.width = 50;
		platr.height = 50;
		platr_box = engine.CreateBox(platr.x+10, platr.y+15, platr.width/2, platr.height/2, false,1,.5,false,"",.9,0,"cr");
		
		//engine.d_debug();
		
		var i:Int = 0;
		var lim:Int = 10;
		var wih:Int =15;
		
		while(i<lim){spikb.push(new Bitmap(util.Util.loadImage("Lib/img/spike.png")));i++;}
		for(i in 0...lim)
		{
			spikb[i].rotation = 180;
			if(i==0)spikb[i].x = 170;	
			else spikb[i].x = spikb[i-1].x+wih;
			spikb[i].y = 190;
			spikb[i].width = 15;
			spikb[i].height = 30;
			engine.st.addChild(spikb[i]);
			spikb_box.push(engine.CreateBox(spikb[i].x-15, spikb[i].y, 15, 10, false,1,0,false,"spike"));
		}
		engine.st.addEventListener(Event.ENTER_FRAME, Movespik);
	}
	private function Movespik(e:Event){
		var i:Int; 
		if(stps<70 && !engine.pause){	
			if (dir == "down") {	for(i in 0...10){spikb[i].y += 2;}  }
			else if(dir == "up"){	for(i in 0...10){spikb[i].y -= 2;}	}
			stps++;
			for(i in 0...10){spikb_box[i].setPosition(new B2Vec2(spikb[i].x/30,spikb[i].y/30));}
		}else if(stps >= 70 && !engine.pause){
			if (dir == "down") { dir = "up";	}
			else if(dir == "up"){ dir = "down";	}
			stps = 0;
		}
		
		if(rpstps<140 && !engine.pause){	
			if (rpdir == "right") {	platr.x += 2;  }
			else if(rpdir == "left"){	platr.x -= 2;	}
			rpstps++;
			platr_box.setPosition(new B2Vec2((platr.x+23)/30,(platr.y+27)/30));
		}else if(rpstps >= 140 && !engine.pause){
			if (rpdir == "right") { rpdir = "left";	}
			else if(rpdir == "left"){ rpdir = "right";	}
			rpstps = 0;
		}
		
	}
}