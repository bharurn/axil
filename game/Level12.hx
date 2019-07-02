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
	 * Axil Game Level 12
	 */
	
class Level12 
{
	public var engine:Base;
	var stps:Int; 
	private var dir:String;
	
	var platr:Bitmap;
	var platr_box:B2Body;
	public function new(s:Stage) 
	{
		
		engine = new Base(s,110,40,12);
		engine.crtend(13,310,720,60);
		
		stps = 0;
		dir = "right";
		
		var platx:Array<Int> = new Array(); 
		var platy:Array<Int> = new Array();
		
		var i:Int =0;
		
		
		for (i in 0...30) {
			if (i == 0) platy[i] = 100;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 60;
		}
		
		for (i in 30...60) {
			if (i == 30) platy[i] = 30;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 180;
		}
		
		for (i in 60...90) {
			if (i == 60) platy[i] = 100;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 350;
		}
		
		for (i in 90...127) {
			if (i == 90) platy[i] = 100;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 470;
		}
		
		for (i in 127...157) {
			if (i == 127) platy[i] = 30;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 590;
		}
		
		for (i in 157...187) {
			if (i == 157) platy[i] = 100;
			else platy[i] = platy[i - 1] + 12;
			platx[i] = 710;
		}
		
		engine.crtground(platx, platy);
		engine.crtgun([210, 365, 380, 720], [210, 380, 130, 330], [0, 1, 0, 1]);
		//engine.d_debug();
		
		platr = new Bitmap(Util.loadImage("Lib/img/rnd_platform.png"));
		engine.st.addChild(platr);
		platr.x = 40;
		platr.y = 470;
		platr.width = 50;
		platr.height = 50;
		platr_box = engine.CreateBox(platr.x+10, platr.y+15, platr.width/2, platr.height/2, false,1,.5,false,"",.9,0,"cr");
		engine.st.addEventListener(Event.ENTER_FRAME, upgame);
	}
		 
	private function upgame(e:Event){
		if(stps<350 && !engine.pause){	
			if (dir == "right") {	platr.x += 2;  }
			else if(dir == "left"){	platr.x -= 2;	}
			stps++;
			platr_box.setPosition(new B2Vec2((platr.x+23)/30,(platr.y+27)/30));
		}else if(stps >= 350 && !engine.pause){
			if (dir == "right") { dir = "left";	}
			else if(dir == "left"){ dir = "right";	}
			stps = 0;
		}
		
	}
	
}