package game;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import util.Util;
import game.Base;

	
/**
 * @author Bharath Raghavan (BR)
 * Axil Game Level 7
 */

class Level7  
{
	public var engine:Base;
	private var lock_box:B2Body;
	private var lock:Bitmap;
		
	public function new(s:Stage) 
	{
		engine = new Base(s, 40, 40, 7);
		
		lock = new Bitmap(Util.loadImage("Lib/img/door.png"));
			
		var plattx:Array<Int> = [30]; var platty:Array<Int> = [160];
			
		var platx:Array<Int> = new Array(); var platy:Array<Int> = new Array();
		var i:Int;
		for (i in 0...6) {
			if (i == 0) platx[i] = 200;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 250;
		}
			
		for (i in 6...10) {
			if (i == 6) platx[i] = 620;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 140;
		}
			
		for (i in 10...14) {
			if (i == 10) platx[i] = 500;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 400;
		}
			
		for (i in 14...18) {
			if (i == 14) platx[i] = 390;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 540;
		}
			
		for (i in 18...26) {
			if (i == 18) platx[i] = 20;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 390;
		}

		for (i in 26...34) {
			if (i == 26) platx[i] = 20;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 480;
		}
			
		for (i in 34...36) {
			if (i == 34) platx[i] = 580;
			else platx[i] = platx[i - 1] + 25;
			platy[i] = 210;
		}
		engine.crtroundground(plattx, platty);
		engine.crtground(platx, platy);
		engine.crtspikeswing([190, 450], [100, 200]);
		engine.crtswitch(660,100);
		engine.crtend(420, 490, 80, 440);
		
		engine.st.addChild(lock);
		lock.width = 10;
		lock.height = 70;
		lock.x = 160;
		lock.y = 406;
		
		lock_box = engine.CreateBox(lock.x, lock.y, lock.width, lock.height, false,1,0, true, "lock",0);
			
		engine.st.addEventListener(Event.ENTER_FRAME, Update);
			
		//engine.d_debug();
	}
		
	private function Update(e:Event){
		if(engine.switch_on){
			engine.st.removeChild(lock);
			lock_box.setPosition(new B2Vec2( -30, -30));
		}
	}
		
}