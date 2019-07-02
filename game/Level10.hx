package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
import util.Util;
    
	
	/**
	 * @author Bharath Raghavan(BR)
	 * Axil Game Level 10
	 */
		
class Level10
{
	public var engine:Base;
	var platr:Array<Bitmap>;
	var platr_box:Array<B2Body>;
	
	var stps:Array<Int>; 
	var dir:Array<String>;	
	public function new(s:Stage) 
	{
		engine = new Base(s, 110, 100, 10);
		
		var i:Int = 0;
		
		platr = new Array();
		platr_box = new Array();
		stps = new Array();
		dir = new Array();
		
		engine.crtend(710, 80, 10, 410);
		engine.crtgun([80,700],[50,350],[0,1]);
		
		i = 0;
		platr.push(new Bitmap(Util.loadImage("Lib/img/rnd_platform.png")));
		engine.st.addChild(platr[i]);
		stps.push(0);
		dir.push("right");
		platr[i].x = 90;
		platr[i].y = 170;
		platr[i].width = 50;
		platr[i].height = 50;
		platr_box.push(engine.CreateBox(platr[i].x + 10, platr[i].y + 15, platr[i].width / 2, platr[i].height / 2, false, 1, .5, false, "", .9, 0, "cr") );
		
		i = 1;
		platr.push(new Bitmap(Util.loadImage("Lib/img/rnd_platform.png")));
		engine.st.addChild(platr[i]);
		stps.push(0);
		dir.push("left");
		platr[i].x = 590;
		platr[i].y = 260;
		platr[i].width = 50;
		platr[i].height = 50;
		platr_box.push(engine.CreateBox(platr[i].x + 10, platr[i].y + 15, platr[i].width / 2, platr[i].height / 2, false, 1, .5, false, "", .9, 0, "cr") );
		
		i = 2;
		platr.push(new Bitmap(Util.loadImage("Lib/img/rnd_platform.png")));
		engine.st.addChild(platr[i]);
		stps.push(0);
		dir.push("right");
		platr[i].x = 100;
		platr[i].y = 360;
		platr[i].width = 50;
		platr[i].height = 50;
		platr_box.push(engine.CreateBox(platr[i].x + 10, platr[i].y + 15, platr[i].width / 2, platr[i].height / 2, false, 1, .5, false, "", .9, 0, "cr") );
		
		i = 3;
		platr.push(new Bitmap(Util.loadImage("Lib/img/rnd_platform.png")));
		engine.st.addChild(platr[i]);
		stps.push(0);
		dir.push("left");
		platr[i].x = 740;
		platr[i].y = 460;
		platr[i].width = 50;
		platr[i].height = 50;
		platr_box.push(engine.CreateBox(platr[i].x+10, platr[i].y+15, platr[i].width/2, platr[i].height/2, false,1,.5,false,"",.9,0,"cr") );
			
		//engine.d_debug();
		
		engine.st.addEventListener(Event.ENTER_FRAME, upgame);
	}
	private function upgame(e:Event){
		var i:Int; 
		
		for(i in 0...4 ){
			if(stps[i]<270 && !engine.pause){	
				if (dir[i] == "right") {	platr[i].x += 2;  }
				else if(dir[i] == "left"){	platr[i].x -= 2;	}
				stps[i]++;
				platr_box[i].setPosition(new B2Vec2((platr[i].x+23)/30,(platr[i].y+27)/30));
			}else if(stps[i] >= 270 && !engine.pause){
				if (dir[i] == "right") { dir[i] = "left";	}
				else if(dir[i] == "left"){ dir[i] = "right";	}
			stps[i] = 0;
			}
		}
	}
}