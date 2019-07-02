package;
import flash.display.Stage;
import nme.Lib;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.events.Event;
import flash.display.MovieClip;
import flash.display.StageDisplayState;
import game.Base;
import game.Level2;
import game.Level1;
import game.Level3;
import game.Level4;
import game.Level5;
import game.Level6;
import game.Level7;
import game.Level8;
import game.Level9;
import game.Level10;
import game.Level11;
import game.Level12;
import game.Level13;
import game.Level14;
import game.Menu;
import game.tutorial.Tlevel1;
import util.Util;

	/**
	 * @author Bharath Raghavan(BR)
	 * Axil Game Main class
	 */
	

class Axil
{
	private var level_engine:Dynamic;
	private var menu_state:Bool;
	private var st:Stage;
   public function new()
   {
	  st = flash.Lib.current.stage;
	  level_engine = new Menu(st);
	  menu_state = true;
	  st.addEventListener(Event.ENTER_FRAME, UpdateGame);
	  
   }
   
   public function UpdateGame(e:Event) {
			if(!menu_state){
				if (level_engine.engine.menu) {
					level_engine = new Menu(st);
					menu_state = true;
				}else if (level_engine.engine.level == -1 && level_engine.engine.restart) {
					level_engine = new Tlevel1(st);
				}else if (level_engine.engine.level == 1 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level1(st);
				}else if (level_engine.engine.level == 2 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level2(st);
				}else if (level_engine.engine.level == 3 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level3(st);
				}else if (level_engine.engine.level == 4 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level4(st);
				}else if (level_engine.engine.level == 5 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level5(st);
				}else if (level_engine.engine.level == 6 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level6(st);
				}else if (level_engine.engine.level == 7 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level7(st);
				}else if (level_engine.engine.level == 8 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level8(st);
				}else if (level_engine.engine.level == 9 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level9(st);
				}else if (level_engine.engine.level == 10 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level10(st);
				}else if (level_engine.engine.level == 11 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level11(st);
				}else if (level_engine.engine.level == 12 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level12(st);
				}else if (level_engine.engine.level == 13 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level13(st);
				}else if (level_engine.engine.level == 14 && (level_engine.engine.win || level_engine.engine.restart)) {
					level_engine = new Level14(st);
				}else if (level_engine.engine.level == 15 && level_engine.engine.win) {
					level_engine = new Menu(st);
					level_engine.WinFunc();
					menu_state = true;
				}
			}else if (menu_state) {
				if (level_engine.choose_level == -1) {
					level_engine = new Tlevel1(st);
					menu_state = false;
			    }else if (level_engine.choose_level == 1) {
					level_engine = new Level1(st);
					menu_state = false;
				}else if (level_engine.choose_level == 2) {
					level_engine = new Level2(st);
					menu_state = false;
				}else if (level_engine.choose_level == 3) {
					level_engine = new Level3(st);
					menu_state = false;
				}else if (level_engine.choose_level == 4) {
					level_engine = new Level4(st);
					menu_state = false;
				}else if (level_engine.choose_level == 5) {
					level_engine = new Level5(st);
					menu_state = false;
				}else if (level_engine.choose_level == 6) {
					level_engine = new Level6(st);
					menu_state = false;
				}else if (level_engine.choose_level == 7) {
					level_engine = new Level7(st);
					menu_state = false;
				}else if (level_engine.choose_level == 8) {
					level_engine = new Level8(st);
					menu_state = false;
				}else if (level_engine.choose_level == 9) {
					level_engine = new Level9(st);
					menu_state = false;
				}else if (level_engine.choose_level == 10) {
					level_engine = new Level10(st);
					menu_state = false;
				}else if (level_engine.choose_level == 11) {
					level_engine = new Level11(st);
					menu_state = false;
				}else if (level_engine.choose_level == 12) {
					level_engine = new Level12(st);
					menu_state = false;
				}else if (level_engine.choose_level == 13) {
					level_engine = new Level13(st);
					menu_state = false;
				}else if (level_engine.choose_level == 14) {
					level_engine = new Level14(st);
					menu_state = false;
				}
			}
			
		}
  
   static public function main()
   {
	  #if flash
            new Axil();
      #else
            neko.Lib.print("Starting Axil v1.0 ....................\nDone. You can now enjoy.\nAxil Made By Bharath Raghavan Games\n");
			Lib.create(function() { new Axil(); }, 800, 600, 60, 0xccccff, (1 * Lib.HARDWARE), "Axil", "", BitmapData.loadFromBytes( nme.utils.ByteArray.readFile("Lib/img/axil.png") ) );
      #end

   }
}