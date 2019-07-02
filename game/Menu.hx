package game;

import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.media.Sound;
import flash.media.SoundChannel;
import flash.net.SharedObject;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.KeyboardEvent;
import flash.text.TextField;
import flash.ui.Keyboard;
import flash.display.Bitmap;
import flash.text.TextField;
import flash.text.TextFormat;
import game.Level1;
import game.Level2;
import game.Level3;
import game.Level4;
import game.Level5;
import game.Level6;
import game.Level7;
import game.Level8;
import util.Axilbutton;
import util.Util;

/**
 * ...
 * @author Bharat Raghavan
 */
class Menu
{
	public var stg:Stage;
	private var level_engine:Array<Int>;
	private var play_button:Axilbutton;
	private var help_button:Axilbutton;
	private var about_button:Axilbutton;
	private var settings_button:Axilbutton;
	private var inc_button:Axilbutton;
	private var dec_button:Axilbutton;
	private var help_txt:Bitmap;
	private var about_txt:Bitmap;
	private var win_txt:Bitmap;
	private var back_button:Axilbutton;
	private var symb:Bitmap;
	private var brsymb:Bitmap;
	private var lt_button:Axilbutton;
	private var l1_button:Axilbutton;
	private var l2_button:Axilbutton;
	private var l3_button:Axilbutton;
	private var l4_button:Axilbutton;
	private var l5_button:Axilbutton;
	private var l6_button:Axilbutton;
	private var l7_button:Axilbutton;
	private var l8_button:Axilbutton;
	private var l9_button:Axilbutton;
	private var l10_button:Axilbutton;
	private var l11_button:Axilbutton;
	private var l12_button:Axilbutton;
	private var l13_button:Axilbutton;
	private var l14_button:Axilbutton;
	public var choose_level:Int;
	private var currlev :Int;
	private var txt:TextField;
	
	public function new(s:Stage) {
		stg = s;
		
		symb = new Bitmap(Util.loadImage("Lib/img/axilsymbol.png"));
		back_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/back_button.png")));
	    brsymb = new Bitmap(Util.loadImage("Lib/img/brsymbol.png"));
		
		play_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/play_button.png")));
		help_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/help_button.png")));
		about_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/about_button.png")));
		settings_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/settings_button.png")));
		dec_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/dec_button.png")));
		inc_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/inc_button.png")));
		
		help_txt = new Bitmap(Util.loadImage("Lib/img/help_txt.png"));
		about_txt = new Bitmap(Util.loadImage("Lib/img/about_txt.png"));
		win_txt = new Bitmap(Util.loadImage("Lib/img/win_txt.png"));
		
		lt_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/lt.png")));
		l1_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l1.png")));
		l2_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l2.png")));
		l3_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l3.png")));
		l4_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l4.png")));
		l5_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l5.png")));
		l6_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l6.png")));
		l7_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l7.png")));
		l8_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l8.png")));
		l9_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l9.png")));
		l10_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l10.png")));
		l11_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l11.png")));
		l12_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l12.png")));
		l13_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l13.png")));
		l14_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/l14.png")));
		
		choose_level = 0;
			
		var backmsc:Sound=  new Sound(new nme.net.URLRequest("Lib/snd/msc0.mp3"), null, false);
		var backmscc:SoundChannel;
		backmscc = backmsc.play(0,0);
		
	    currlev = Std.parseInt( Util.getData("lev") ); 
	     
		Frame1();
	}
		
	private function Frame1():Void {
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
			
		stg.addChild(play_button);
		stg.addChild(help_button);
		stg.addChild(about_button);
		stg.addChild(settings_button);
		stg.addChild(symb);
		stg.addChild(brsymb);  
		
		symb.x = 100;
		symb.y = 60;
		
		brsymb.x = 640;
		brsymb.y = 20;
		brsymb.width = 50;
		brsymb.height = 50;
		
		play_button.x = 300;
		play_button.y = 150;
		
		play_button.addEventListener(MouseEvent.CLICK, ClickToPlay);
		
		help_button.x = 400;
		help_button.y = 260;
		
		help_button.addEventListener(MouseEvent.CLICK, ClickToHelp);
		
		about_button.x = 480;
		about_button.y = 370;
		
		about_button.addEventListener(MouseEvent.CLICK, ClickToAbout);
		
		settings_button.x = 560;
		settings_button.y = 480;
		
		settings_button.addEventListener(MouseEvent.CLICK, ClickToSettings);
	}
	
	private function ClickToHelp(event:MouseEvent):Void
	{
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
		
		stg.addChild(help_txt);
		help_txt.x = 20;
		help_txt.y = 80;
			
		stg.addChild(back_button);
		back_button.x = 300;
		back_button.y = 10;
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
		
			
		stg.addEventListener(KeyboardEvent.KEY_DOWN, fl_KeyboardDownHandler);		
	}
	function fl_KeyboardDownHandler(event:KeyboardEvent):Void
	{
		if (event.keyCode  == Keyboard.DOWN) { help_txt.y -= 10; back_button.y -= 10;}
		if (event.keyCode  == Keyboard.UP) { help_txt.y += 10; back_button.y += 10; }
	}
	private function ClickToAbout(event:MouseEvent):Void
	{
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
		
		stg.addChild(about_txt);
		about_txt.x = 20;
		about_txt.y = 80;
		
		stg.addChild(back_button);
		back_button.x = 560;
		back_button.y = 50;
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
		
	}
	private function ClickToSettings(event:MouseEvent):Void
	{
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
		
		stg.addChild(inc_button);
		inc_button.x = 210;
		inc_button.y = 100;
		inc_button.addEventListener(MouseEvent.CLICK, ClickToInc);
		
		stg.addChild(dec_button);
		dec_button.x = 50;
		dec_button.y = 100;
		dec_button.addEventListener(MouseEvent.CLICK, ClickToDec);
		
		stg.addChild(back_button);
		back_button.x = 560;
		back_button.y = 50;
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
		
		txt = new TextField();
			
		txt.width = 90;
		txt.height = 60;
		stg.addChild(txt);
		txt.x = 110;
		txt.y = 127;
			
		if (Util.getData("spd") == "50") txt.text = "Super Fast";
		else if (Util.getData("spd") == "60") txt.text = "Fast";
		else if (Util.getData("spd") == "70") txt.text = "Kind of Medium";
		else if (Util.getData("spd") == "80") txt.text = "Medium";
		else if (Util.getData("spd") == "90") txt.text = "Slow";
		else if (Util.getData("spd") == "100") txt.text = "Super Slow";
		
		var speedtxt:TextField = new TextField();
			
		var speedtxtfrm:TextFormat = new TextFormat();
		speedtxt.width = 140;
		speedtxt.height = 60;
		speedtxt.text = "Set Speed";
		stg.addChild(speedtxt);
		speedtxt.x = 100;
		speedtxt.y = 60;
		speedtxtfrm.size = 30;
		speedtxt.setTextFormat(speedtxtfrm);
	}
	private function ClickToInc(event:MouseEvent):Void
	{
		var temp:Int = Std.parseInt(Util.getData("spd") ) -10;
	 
		if(Std.parseInt(Util.getData("spd"))>50) 	
			Util.writeData("spd", Std.string(temp) );
		if (Util.getData("spd") == "50") txt.text = "Super Fast";
		else if (Util.getData("spd") == "60") txt.text = "Fast";
		else if (Util.getData("spd") == "70") txt.text = "Kind of Medium";
		else if (Util.getData("spd") == "80") txt.text = "Medium";
		else if (Util.getData("spd") == "90") txt.text = "Slow";
		else if (Util.getData("spd") == "100") txt.text = "Super Slow";
	}
	private function ClickToDec(event:MouseEvent):Void
	{
		var temp:Int = Std.parseInt(Util.getData("spd") ) +10;
	 
		if(Std.parseInt(Util.getData("spd"))<100) 	
			Util.writeData("spd",	Std.string(temp) );
		if (Util.getData("spd") == "50") txt.text = "Super Fast";
		else if (Util.getData("spd") == "60") txt.text = "Fast";
		else if (Util.getData("spd") == "70") txt.text = "Kind of Medium";
		else if (Util.getData("spd") == "80") txt.text = "Medium";
		else if (Util.getData("spd") == "90") txt.text = "Slow";
		else if (Util.getData("spd") == "100") txt.text = "Super Slow";
	}
	public function WinFunc():Void
	{
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
		
		stg.addChild(win_txt);
		win_txt.x = 50;
		win_txt.y = 80;
		
		stg.addChild(back_button);
		back_button.x = 560;
		back_button.y = 50;
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
		
	}
	private function ClickToBack(event:MouseEvent):Void
	{
		Frame1();
	}
	private function ClickToPlay(event:MouseEvent):Void
	{
		if(stg.numChildren!=0){
			var k:Int = stg.numChildren-1;
			while(k!=0)
			{
				stg.removeChildAt( k );
				k--;
			}
		}		
		
		stg.addChild(lt_button);
		stg.addChild(l1_button);
		if(currlev >= 2)stg.addChild(l2_button);
		if(currlev >= 3)stg.addChild(l3_button);
		if(currlev >= 4)stg.addChild(l4_button);
		if(currlev >= 5)stg.addChild(l5_button);
		if(currlev >= 6)stg.addChild(l6_button);
		if(currlev >= 7)stg.addChild(l7_button);
		if (currlev >= 8) stg.addChild(l8_button);
		if (currlev >= 9) stg.addChild(l9_button);
		if (currlev >= 10) stg.addChild(l10_button);
		if (currlev >= 11) stg.addChild(l11_button);
		if (currlev >= 12) stg.addChild(l12_button);
		if (currlev >= 13) stg.addChild(l13_button);
		if (currlev >= 14) stg.addChild(l14_button);
		  
		lt_button.x = 150;
		lt_button.y = 40;
		
		l1_button.x = 150;
		l1_button.y = 100;
		
		l2_button.x = 150;
		l2_button.y = 160;
		
		l3_button.x = 150;
		l3_button.y = 220;
		
		l4_button.x = 150;
		l4_button.y = 280;
		
		l5_button.x = 150;
		l5_button.y = 340;
		
		l6_button.x = 150;
		l6_button.y = 400;
		
	    l7_button.x = 150;
		l7_button.y = 460;
		
		l8_button.x = 150;
		l8_button.y = 520;
		
		l9_button.x = 250;
		l9_button.y = 40;
		
		l10_button.x = 250;
		l10_button.y = 100;
		
		l11_button.x = 250;
		l11_button.y = 160;
		
		l12_button.x = 250;
		l12_button.y = 220;
		
		l13_button.x = 250;
		l13_button.y = 280;
		
		l14_button.x = 250;
		l14_button.y = 340;
		
		stg.addChild(back_button);
		back_button.x = 560;
		back_button.y = 50;
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
		
		lt_button.addEventListener(MouseEvent.CLICK, ClickTolt);
		l1_button.addEventListener(MouseEvent.CLICK, ClickTol1);
		l2_button.addEventListener(MouseEvent.CLICK, ClickTol2);
		l3_button.addEventListener(MouseEvent.CLICK, ClickTol3);
		l4_button.addEventListener(MouseEvent.CLICK, ClickTol4);
		l5_button.addEventListener(MouseEvent.CLICK, ClickTol5);
		l6_button.addEventListener(MouseEvent.CLICK, ClickTol6);
		l7_button.addEventListener(MouseEvent.CLICK, ClickTol7);
		l8_button.addEventListener(MouseEvent.CLICK, ClickTol8);
		l9_button.addEventListener(MouseEvent.CLICK, ClickTol9);
		l10_button.addEventListener(MouseEvent.CLICK, ClickTol10);
		l11_button.addEventListener(MouseEvent.CLICK, ClickTol11);
		l12_button.addEventListener(MouseEvent.CLICK, ClickTol12);
		l13_button.addEventListener(MouseEvent.CLICK, ClickTol13);
		l14_button.addEventListener(MouseEvent.CLICK, ClickTol14);
	}
	private function ClickTolt(event:MouseEvent):Void
	{
		choose_level = -1;
	}
	private function ClickTol1(event:MouseEvent):Void
	{
		choose_level = 1;
	}
	private function ClickTol2(event:MouseEvent):Void
	{
		choose_level = 2;
	}
	private function ClickTol3(event:MouseEvent):Void
	{
		choose_level = 3;
	}
	private function ClickTol4(event:MouseEvent):Void
	{
		choose_level = 4;
	}
	private function ClickTol5(event:MouseEvent):Void
	{
		choose_level = 5;
	}
	private function ClickTol6(event:MouseEvent):Void
	{
		choose_level = 6;
	}
	private function ClickTol7(event:MouseEvent):Void
	{
		choose_level = 7;
	}
	private function ClickTol8(event:MouseEvent):Void
	{
		choose_level = 8;
	}
	private function ClickTol9(event:MouseEvent):Void
	{
		choose_level = 9;
	}
	private function ClickTol10(event:MouseEvent):Void
	{
		choose_level = 10;
	}
	private function ClickTol11(event:MouseEvent):Void
	{
		choose_level = 11;
	}
	private function ClickTol12(event:MouseEvent):Void
	{
		choose_level = 12;
	}
	private function ClickTol13(event:MouseEvent):Void
	{
		choose_level = 13;
	}
	private function ClickTol14(event:MouseEvent):Void
	{
		choose_level = 14;
	}
}