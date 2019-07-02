package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.media.SoundChannel;
import flash.events.Event;
import box2D.dynamics.B2Body;
import game.Base;
import box2D.common.math.B2Vec2;
                                 
class Level4 
{
	private var lock_box:B2Body;
	private var lock:Bitmap;
	public var engine:Base;
	
	public function new(s:Stage) 
	{
		
		var i:Int = 0;
		
		lock = new Bitmap(util.Util.loadImage("Lib/img/door.png"));
			
		engine = new Base(s,160,20,4);
			
		var platx:Array<Int> = [10,35,60,85,110,135,160,185,210,235,260,285,310,335,360,385,410,435];
		var platy:Array<Int> = [110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110,110];
			
		for(i in 17...43){
			if(i==17)platx.push(135);
			else platx.push(platx[i]+25);
			platy.push(190);
		}
			
		for(i in 43...69){
			if(i==43)platx.push(10);
			else platx.push(platx[i]+25);
			platy.push(250);
		}
			
			
		for(i in 69...95){
			if(i==69)platx.push(135);
			else platx.push(platx[i]+25);
			platy.push(330);
		}
			
		for(i in 95...121){
			if(i==95)platx.push(10);
			else platx.push(platx[i]+25);
			platy.push(410);
		}
			
		for(i in 121...147){
			if(i==121)platx.push(135);
			else platx.push(platx[i]+25);
			platy.push(499);
		}
			
		for(i in 147...150){
			if(i==147)platx.push(40);
			else platx.push(platx[i]+25);
			platy.push(530);
		}
			
		//engine.d_debug();
		engine.crtground(platx,platy);
		engine.crtend(47,65,75,490);
		engine.crtgun([30,730,730],[160,300,470],[0,1,1]);
		
		engine.crtswitch(740,460);
			
		engine.st.addChild(lock);
		lock.width = 11;
		lock.height = 80;
		lock.x = 85;
		lock.y = 30;
			
		lock_box = engine.CreateBox(lock.x, lock.y, lock.width, lock.height, false,1,0, true, "lock",0);
			
		engine.st.addEventListener(Event.ENTER_FRAME, Move);
	}
		
	private function Move(e:Event){
		if(engine.switch_on){
			engine.st.removeChild(lock);
			lock_box.setPosition(new B2Vec2(-30,-30));
		}
	}
	 
}