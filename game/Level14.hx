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

class Level14 
{
	public var engine:Base;
	
	public function new(s:Stage) 
	{
		engine = new Base(s, 40, 40, 14);
		
			
		var plattx:Array<Int> = [30,170,350]; var platty:Array<Int> = [160,450,400];
			
		var i:Int;
		engine.crtroundground(plattx, platty);
		engine.crtspikeswing([150, 300, 450, 600, 
									170, 310, 450, 550], 
		
							 [310, 310, 310, 310, 
									150, 250, 120, 420]);
		engine.crtend(40, 470, 520, 240);
		//engine.d_debug();
	}
		
}