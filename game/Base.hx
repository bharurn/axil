package game;
import flash.display.Bitmap;
import flash.display.BitmapData;
import nme.geom.Matrix;
import nme.Lib;
import flash.display.Sprite;
import flash.display.Shape;
import flash.events.Event;
import box2D.common.math.B2Vec2;
import box2D.collision.B2WorldManifold;
import box2D.collision.shapes.B2PolygonShape;
import box2D.dynamics.B2Body;
import box2D.dynamics.joints.B2Joint;
import box2D.dynamics.joints.B2JointDef;
import box2D.dynamics.joints.B2RevoluteJoint;
import box2D.dynamics.joints.B2RevoluteJointDef;
import box2D.dynamics.B2BodyDef;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.B2FixtureDef;
import box2D.dynamics.B2World;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.collision.shapes.B2CircleShape;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Stage;
import flash.display.Bitmap;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.geom.Point;
import flash.media.SoundChannel;
import flash.media.Sound;
import flash.net.SharedObject;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.geom.Matrix;
//import flash.events.TimerEvent;
import flash.ui.Keyboard;
import haxe.Timer;
import util.Util;
import util.Axilbutton;
import util.Axilmovieclip;


	/**
	 * @author Bharath Raghavan(BR)
	 * Axil Game Engine(Base)
	 */
	

class Base
{
	    private static inline var gravity:Float = 9.8; //gravity direction, positive is down in screen coordinates
		private static inline var scale:Int = 30; //the scale the Box2d world will be compared to screen size
 
		private var world:B2World; //create the "physics world"
 
		private var hero_box:B2Body; //the object we'll use to control our "hero"/ main character
 		private var red_box:B2Body;
		private var blue_box:B2Body;
		private var bull_box:Array<Dynamic>;
 
		//NEW for keyboard input
		private var keys_down:Array<Int>; //array to hold which keys are currently down
		private var hero_speed:Int; //the amount we'll add to the impulse of the hero when moving left or right
		private var hero_max_speed:Int; //the maximum amount we will let the hero's linear velocity move sideways (x direction)
		private var jump_speed:Int; //the amount of impulse to make the hero "jump"
		private var hero_size:Int; //The hero total width/ height in pixels
		private var hero_sizew:Int; //The hero total width/ height in pixels
		private var hero_sizeh:Int; //The hero total width/ height in pixels
 		
		private var char:Bitmap;
		private var red:Bitmap;
		private var blue:Bitmap;
		private var swit:Bitmap;
		private var plata:Array<Dynamic>;
		private var platr:Array<Dynamic>;
		private var spika:Array<Dynamic>;
		private var spikta:Array<Dynamic>;
		private var spikswing:Array<Dynamic>;
		private var spikswing_box:Array<Dynamic>;
		private var spikcenter_box:Array<Dynamic>;
		private var revoluteJointDef:Array<Dynamic>;
		private var m_joint:Array<Dynamic>;
		private var guna:Array<Dynamic>;
		private var bull:Array<Dynamic>;
		
		private var timer:Timer;
											
		private var sx:Int;var sy:Int;
		
		public var red_got:Bool;
		public var blue_got:Bool;
		
		public var st:Stage;
		
		private var gun_shoot:Bool;
		
		private var gx1:Int;private var gx2:Int;private var gy1:Int;private var gy2:Int;
		
		private var level:Int;
		
		public var switch_on:Bool;
		private var heart:Array<Dynamic>;
		
		private var dead:Bool;
		
		private var endsound:Sound;
		private var endsoundc:SoundChannel;
		
		private var deadsound:Sound;
		private var deadsoundc:SoundChannel;
		
		private var deadgonesound:Sound;
		private var deadgonesoundc:SoundChannel;
		
		private var opensound:Sound;
		private var opensoundc:SoundChannel;
		
		public var win:Bool;
		
		var backmsc1:Sound;
		var backmsc2:Sound;
		var backmsc3:Sound;
		var backmsc4:Sound;
		var backmsc5:Sound;
		var backmsc6:Sound;
		var backmsc7:Sound;
		var backmsc8:Sound;
		var backmsc9:Sound;

		var backmscc:SoundChannel;
		
		public var pause:Bool;
		
		var menu:Bool;
		
		var ltxt:TextField;
		var ltxtfrm:TextFormat;
	
		private var back_button:Axilbutton;
		
		public var restart:Bool;
		
		private var bull_shoot_flag:Bool;
		
		private var spd:Float;
		
		var invinsible:Bool;

		var no_hurt:Bool;
   public function new(stg:Stage,startx:Int,starty:Int,lev:Int)
   {
	  st = stg;
	 
	  st.addChild(new Bitmap(Util.loadImage("Lib/img/back.png")));
	  
	  sx = startx;sy=starty;
			
	  level = lev;
	 
	  spd =  Std.parseFloat(Util.getData("spd")) ;
	 
	  if (Std.parseInt( Util.getData("lev") ) < level)Util.writeData("lev", Std.string(level));
	   
	  world = new B2World(new B2Vec2(0, gravity), true); //initialize the world; first parameter a 2d vector to represent the direction+magnitude of gravity (straight down and at 9.8m/s^2
			
	  create(startx, starty);		 
	  
	  //st.addEventListener(Event.ENTER_FRAME, RunGame); 
	  
   }
   
   private function init() {
 		
		char = new Bitmap(Util.loadImage("Lib/img/axil_char.png"));
		red = new Bitmap(Util.loadImage("Lib/img/redend.png"));
		blue = new Bitmap(Util.loadImage("Lib/img/blueend.png"));
		swit = new Bitmap(Util.loadImage("Lib/img/switch.png"));
		back_button = new Axilbutton(new Bitmap(Util.loadImage("Lib/img/back_button.png")));
		char.smoothing = true;
		endsound = new Sound(new nme.net.URLRequest("Lib/snd/endsound.wav"), null, false);
		
		deadsound = new Sound(new nme.net.URLRequest("Lib/snd/deadsound.wav"), null, false);
		
		deadgonesound = new Sound(new nme.net.URLRequest("Lib/snd/deadgonesound.wav"), null, false);
		
		opensound = new Sound(new nme.net.URLRequest("Lib/snd/opensound.wav"), null, false);
		
		backmsc1 = new Sound(new nme.net.URLRequest("Lib/snd/msc1.mp3"), null, false);
		backmsc2 = new Sound(new nme.net.URLRequest("Lib/snd/msc2.mp3"), null, false);
		backmsc3 = new Sound(new nme.net.URLRequest("Lib/snd/msc3.mp3"), null, false);
		backmsc4 = new Sound(new nme.net.URLRequest("Lib/snd/msc4.mp3"), null, false);
		backmsc5 = new Sound(new nme.net.URLRequest("Lib/snd/msc5.mp3"), null, false);
		backmsc6 = new Sound(new nme.net.URLRequest("Lib/snd/msc6.mp3"), null, false);
		backmsc7 = new Sound(new nme.net.URLRequest("Lib/snd/msc7.mp3"), null, false);
		backmsc8 = new Sound(new nme.net.URLRequest("Lib/snd/msc8.mp3"), null, false);
		backmsc9 = new Sound(new nme.net.URLRequest("Lib/snd/msc9.mp3"), null, false);

		timer = new Timer(7000);
		
		plata = new Array();
		platr = new Array();
		spika = new Array();
		spikta = new Array();
		spikswing = new Array();
		spikswing_box = new Array();
		spikcenter_box = new Array();
		revoluteJointDef = new Array();
		m_joint = new Array();
		guna = new Array();
		bull = new Array();
		heart = new Array();
		bull_box = new Array();
			
		menu = false;
			
		st.addChild(back_button);
		if (level == 3){
			back_button.x = 50;
			back_button.y = 250;
		}else {
			back_button.x = 635;
			back_button.y = 10;
		}
		back_button.width = 160;
		back_button.height = 50;
											
		red_got = false;
		blue_got = false;
		
		gun_shoot = false;
		
		switch_on = false;
			
		dead = false;
		
		win = false;
			
		restart = false;
		
		pause = false;
		
		menu = false;
	
		hero_size = 50;
		
		bull_shoot_flag = false;
		
		invinsible = false;
		
		no_hurt = false;
		
		ltxt = new TextField();
		ltxtfrm = new TextFormat();
			
		back_button.addEventListener(MouseEvent.CLICK, ClickToBack);
			
    }
		
   private function ClickToBack(event:MouseEvent):Void
   {
	        var body:B2Body = world.getBodyList();
			while(body != null)
			{
				world.destroyBody(body);
				body = body.getNext();
			}
			if(st.numChildren!=0){
				var k:Int = st.numChildren-1;
				while(k != 0)
				{
					st.removeChildAt( k );
					k--;
				}
			}
			guna = [];
			bull = [];
			timer.stop();
			if(backmscc != null)backmscc.stop();
			menu = true;
   }
   
   private function create(startx:Int,starty:Int):Void{
			
 			init();

			if (level > 0) ltxt.text = "Level " + level ;
			else ltxt.text = "Tutorial Level" ;
			st.addChild(ltxt);
			ltxt.x = 390;
			ltxt.y = 40;
			
			ltxtfrm.color = "Red";
			ltxtfrm.size = 30;
			ltxt.width = 200;
			ltxt.setTextFormat(ltxtfrm);
			
			if (level == -1) backmscc = backmsc3.play(0,0);
			else if (level == 1) backmscc = backmsc1.play(0,0);
			else if (level == 2) backmscc = backmsc2.play(0,0);
			else if (level == 3) backmscc = backmsc3.play(0,0);
			else if (level == 4) backmscc = backmsc4.play(0,0);
			else if (level == 5) backmscc = backmsc5.play(0,0);
			else if (level == 6) backmscc = backmsc6.play(0,0);
			else if (level == 7) backmscc = backmsc7.play(0,0);
			else if (level == 8) backmscc = backmsc8.play(0, 0);
			else if (level == 9) backmscc = backmsc9.play(0, 0);
			else if (level == 10) backmscc = backmsc5.play(0, 0);
			else if (level == 11) backmscc = backmsc7.play(0, 0);
			else if (level == 12) backmscc = backmsc1.play(0, 0);
			else if (level == 13) backmscc = backmsc4.play(0, 0);
			else if (level == 14) backmscc = backmsc6.play(0,0);
			
			//bounds
			CreateBox(st.stageWidth, 0, 1, st.stageHeight, false,1,0,false,"bound",.1);
			CreateBox(0, 0, 1, st.stageHeight, false,1,0,false,"bound",.1);
			CreateBox(0, 590, st.stageWidth, 14, false,1,0,false,"bound",.7);
			CreateBox(0, 0, st.stageWidth, 1, false,1,0,false,"bound",.3);
			
			st.addChild(char);
			char.width = 39;
			char.height = 40;
			char.x = startx;
			char.y = starty;
			
			hero_box = CreateBox(char.x, char.y, 22, char.height, true,1,1, true, "hero",.3,0,"cr");
 			
			st.addEventListener(Event.ENTER_FRAME, RunGame); //main game loop which will perform calculation simulations each frame, and game processes
           
			//NEW for keyboard input
			hero_speed = 1; //just test and find values that work well
			hero_max_speed = 4;
			jump_speed = 3;
			keys_down = new Array();
			
			//add the "debug drawings" to the screen: 
			//adding the listeners to call the functions when a key has been pressed or released
			st.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			st.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
			
			spikebase();
			
			crtheart();
		}
		/*
		function used to create boxes quickly, without having to do all the box2d initializations each time
		*/
		public function d_debug():Void{
			var debug_sprite:Sprite = new Sprite(); //our debug sprite, where all of the physical objects can be drawn upon before we add graphics
			st.addChild(debug_sprite);
 
			var debug_draw:B2DebugDraw = new B2DebugDraw();
			debug_draw.setSprite(debug_sprite);
			debug_draw.setDrawScale(scale);
			debug_draw.setFlags(box2D.dynamics.B2DebugDraw.e_shapeBit);
			world.setDebugDraw(debug_draw);
		}
		public function CreateBox(x:Float, y:Float, width:Float, height:Float, is_dynamic:Bool, density = 1, friction=.5, fixed_rotation = false, name="", restitution = .1, angle = 0, shape = "sq"):B2Body
		{
		
			//first tranfer all the pixel units Into box2d units
			x = p2m(x);
			y = p2m(y);
			width = p2m(width);
			height = p2m(height);
				
			var box_body:B2BodyDef = new B2BodyDef();
			box_body.angle = angle * 180/3.14;
			//NEW
			box_body.fixedRotation = fixed_rotation;
 
			box_body.position.set(x+width/2, y+height/2); //NOTE: box2d sets the position of the center of an object, not the top left like normal. So we have to add the middle (width/2, height/2) to the position to position where we actually want to have it
 
			if (is_dynamic) box_body.type = box2D.dynamics.B2Body.b2_dynamicBody;
				
			var box_circle_shape:B2CircleShape; 
			
			
 			var box_fixture:B2FixtureDef = new B2FixtureDef();
			if (shape == "cr") {
				box_circle_shape = new B2CircleShape(width);
				box_fixture.shape = box_circle_shape;
			}else if (shape == "sq"){
				var box_poly_shape:B2PolygonShape = new B2PolygonShape();
				box_poly_shape.setAsBox(width / 2, height / 2);
				box_fixture.shape = box_poly_shape;
			}
			
			box_fixture.density = density;
			box_fixture.friction = friction;
			box_fixture.restitution = restitution;
 
			//to store a custom value to a box2d object, you set it's fixture's "userData"- in this case so we can tell an object by it's name string
			box_fixture.userData = {name:name}
			var world_box_body:B2Body = world.createBody(box_body);
			world_box_body.createFixture(box_fixture);
			
			return world_box_body;
		}
		/*
			Main Loop: Used to run the physics simulation each frame, as well as any game processes
		*/
		public function crtground(x:Array<Dynamic>,y:Array<Dynamic>){
			var i:Int = 0;
			plata = [];
			while(i<x.length){plata.push(new Bitmap( Util.loadImage ("Lib/img/platform.png") ) );i++;}
				for(i in 0...x.length)
				{
					st.addChild(plata[i]);
					plata[i].x = x[i];
					plata[i].y = y[i];
					plata[i].width = 40;
					plata[i].height = 10;
					CreateBox(plata[i].x, plata[i].y+4, plata[i].width, plata[i].height-2, false,1,.5,false,"",.9);
				}
				
		}
		public function crtroundground(x:Array<Dynamic>,y:Array<Dynamic>){
			var i:Int = 0;
			platr = [];
			while(i<x.length){platr.push(new Bitmap(Util.loadImage("Lib/img/rnd_platform.png")));i++;}
				for(i in 0...x.length)
				{
					st.addChild(platr[i]);
					platr[i].x = x[i];
					platr[i].y = y[i];
					platr[i].width = 50;
					platr[i].height = 50;
					CreateBox(platr[i].x+10, platr[i].y+15, platr[i].width/2, platr[i].height/2, false,1,.5,false,"",.9,0,"cr");
				}
				
		}
		public function spikebase(){
			var i:Int = 0;
			var lim:Int = 53;
			var wih:Int =20;
			var spikb:Array<Dynamic> = new Array();
			spikb = [];
			while(i<lim){spikb.push(new Bitmap(Util.loadImage("Lib/img/spike.png")));i++;}
			
				for(i in 0...lim)
				{
					if(i==0)spikb[i].x = 0;	
					else spikb[i].x = spikb[i-1].x+wih;
					spikb[i].y = 560;
					spikb[i].width = 15;
					spikb[i].height = 30;
					st.addChild(spikb[i]);
					CreateBox(spikb[i].x, spikb[i].y, 15, 10, false,1,0,false,"spike");
				}
				
		}
		public function crtspike(x:Array<Dynamic>,y:Array<Dynamic>){
			var i:Int = 0;
			spika = [];
			while(i<x.length){spika.push(new Bitmap(Util.loadImage("Lib/img/spike.png")));i++;}
				for(i in 0...x.length)
				{
					st.addChild(spika[i]);
					spika[i].x = x[i];
					spika[i].y = y[i]+5;
					spika[i].width = 15;
					spika[i].height = 30;
					CreateBox(spika[i].x, spika[i].y, 15, 10, false,1,0,false,"spike");
				}
				
		}
		public function crtspiketurned(x:Array<Dynamic>,y:Array<Dynamic>){
			var i:Int = 0;
			spikta = [];
			while(i<x.length){spikta.push(new Bitmap(Util.loadImage("Lib/img/spike.png")));i++;}
				for(i in 0...x.length)
				{
					st.addChild(spikta[i]);
					spikta[i].rotation = 180;
					spikta[i].x = x[i];
					spikta[i].y = y[i]-5;
					spikta[i].width = 15;
					spikta[i].height = 30;
					CreateBox(spikta[i].x-15, spikta[i].y, 15, 10, false,1,0,false,"spike");
				}
				
		}
		public function crtheart(){
			var i:Int = 0;
			while(i<3){heart.push(new Bitmap(Util.loadImage("Lib/img/heart.png")));i++;}
				for(i in 0...3)
				{
					st.addChild(heart[i]);
					if(i==0){
						if(level == 3)	
							heart[i].x = 10;
						else if (level == 12)
							heart[i].x = 450;
						else 
							heart[i].x = 500;
					}else heart[i].x = heart[i-1].x+heart[i].width+5;
					if(level == 3)heart[i].y = 100;
					else heart[i].y = 10;
				}
				
		}
		public function crtend(x1:Int,y1:Int,x2:Int,y2:Int){
			gx1 = x1;
			gy1 = y1;
			gx2 = x2;
			gy2 = y2;
			
			st.addChild(red);
			red.width = 39;
			red.height = 40;
			red.x = x1;
			red.y = y1;
			
			red_box = CreateBox(x1, y1, 22, red.height, false,1,1,true, "red",0,0,"cr");
			
			st.addChild(blue);
			blue.width = 39;
			blue.height = 40;
			blue.x = x2;
			blue.y = y2;
			
			blue_box = CreateBox(x2, y2, 22, blue.height, false,1,1, true, "blue",0,0,"cr");
				
		}
		public function crtswitch(x:Int,y:Int){
			st.addChild(swit);
			swit.x = x;
			swit.y = y;
			swit.width = 23;
			swit.height = 40;
			CreateBox(swit.x, swit.y+20, 24, 14, false,1,.5,false,"switch");
				
		}
		public function crtgun(x:Array<Dynamic>,y:Array<Dynamic>,rotation:Array<Dynamic>){
			var i:Int = 0;
			guna = [];
			while(i<x.length){guna.push(new Bitmap(Util.loadImage("Lib/img/gun.png")));i++;}
				for(i in 0...x.length)
				{
					st.addChild(guna[i]);
					if(rotation[i] == 1) guna[i].rotation = 180; 
					guna[i].x = x[i];
					guna[i].y = y[i];
					guna[i].width = 20;
					guna[i].height = 30;
				}
				for(i in 0...guna.length){
					bull.push(new Bitmap(Util.loadImage("Lib/img/bullet.png")));
					bull_box.push(CreateBox(0, 0, 30, 10, false,1,0,false,"bul"));
				}
				timer.run = bullet_shoot;
		}
		public function crtspikeswing(x:Array<Dynamic>,y:Array<Dynamic>){
			var i:Int = 0;
			spikswing = [];
			while(i<x.length){spikswing.push( new Axilmovieclip( new Bitmap( Util.loadImage( "Lib/img/swing.png" ) ),-28, 0 )  ) ; i++;}
				for(i in 0...x.length)
				{
					st.addChild(spikswing[i]);
					spikswing[i].x = x[i];
					spikswing[i].y = y[i];
					spikswing[i].width = 60;
					spikswing[i].height = 100;
					spikswing_box.push(CreateBox(spikswing[i].x-30, spikswing[i].y +70, 50, 27, true, 1, 0, false, "spike"));
					spikcenter_box.push(CreateBox(spikswing[i].x, spikswing[i].y, 10.0, 10.0, false));
					revoluteJointDef.push(new B2RevoluteJointDef());
					revoluteJointDef[i].initialize( spikswing_box[i],
					spikcenter_box[i], spikcenter_box[i].getWorldCenter());
					revoluteJointDef[i].enableMotor = true;
					revoluteJointDef[i].motorSpeed = 30;
					revoluteJointDef[i].maxMotorTorque = 30;

					m_joint.push(world.createJoint(revoluteJointDef[i]));	

					
				}
				
		}
		private function RunGame(e:Event):Void
		{
			for (i in 0...spikswing.length) {
				spikswing[i].rotation = -(m_joint[i].getJointAngle() * 180/3.14);
			}
			
			if (bull_shoot_flag && !pause) {
				for(i in 0...guna.length){	
					if(guna[i].rotation == 0) bull[i].x += 10;
					else if(guna[i].rotation == 180) bull[i].x -= 10;
					bull_box[i].setPosition(new B2Vec2( p2m(bull[i].x + 10) , p2m(bull[i].y) ) ); 
				}
			}
			
			if(!dead){	
				char.x = m2p(hero_box.getPosition().x)-.5*char.width;
				char.y = m2p(hero_box.getPosition().y)-.5*char.height;
			}
			
			red_box.getPosition().x = p2m(red.x+.5*red.width);
			red_box.getPosition().y = p2m(red.y+.5*red.height);
			
			blue_box.getPosition().x = p2m(blue.x+.5*blue.width);
			blue_box.getPosition().y = p2m(blue.y+.5*blue.height);
	
			if(!pause)world.step(1/spd,10,10); //performs a time step in the box2d simulation
			world.clearForces(); //used to clear the forces after performing the time step
			world.drawDebugData(); //draw the updated debug draw/graphics before adding out graphics

			//lets set the hero box to moving forward, as running along the ground
			 //if the hero is pressing against the side of a block, applying impulse in the x-dir makes him "stick" to it
			if (KeyIsDown(Keyboard.LEFT) && char.alpha == 1){
				if (hero_box.getLinearVelocity().x > - hero_max_speed){ //if we haven't reached the max speed in this direction
					hero_box.applyImpulse(new B2Vec2( -hero_speed, 0), hero_box.getWorldCenter());
					/*bitmapRotationMatrix.identity(); //resets the matrix

			        bitmapRotationMatrix.translate(-0.5*char.width,-0.5*char.he);
					//bitmapRotationMatrix.rotate( -angleInRadians);
					char.transform.matrix = bitmapRotationMatrix;
					//bitmapRotationMatrix.translate(10,10);
					char.rotation -= 10;*/			
					
				}
			}
			else if (KeyIsDown(Keyboard.RIGHT) && char.alpha == 1){
				if (hero_box.getLinearVelocity().x <  hero_max_speed){
					hero_box.applyImpulse(new B2Vec2( hero_speed, 0), hero_box.getWorldCenter());					
				}
			}
			
			//Now to check if the hero can jump (if it is touching the ground)
			//reset the hero normals to nothing, otherwise if it isn't touching something it will maIntain the normals from the last frame
			var can_jump:Bool = false;
			var edge:B2ContactEdge = hero_box.getContactList(); //get all the objects the hero is contacting with
			while (edge != null)
				{
					
					if (edge.contact.isTouching())
					{
						if ( edge.contact.getFixtureA().getUserData().name == "bul" || edge.contact.getFixtureB().getUserData().name == "bul"){
							reset();
						}
						
						else if ( ( edge.contact.getFixtureA().getUserData().name == "" || edge.contact.getFixtureB().getUserData().name == "" ) && hero_box.getLinearVelocity().y > -11){
							can_jump = true;
						}
						else if ( edge.contact.getFixtureA().getUserData().name == "spike" || edge.contact.getFixtureB().getUserData().name == "spike"){
							reset();
						}
						
						else if ( edge.contact.getFixtureA().getUserData().name == "switch" || edge.contact.getFixtureB().getUserData().name == "switch"){
							if(!switch_on)swit.bitmapData = Util.loadImage("Lib/img/switch_open.png");
							switch_on = true;
							if(opensoundc == null)opensoundc = opensound.play(0,0);
						}
						else if ( edge.contact.getFixtureA().getUserData().name == "red" || edge.contact.getFixtureB().getUserData().name == "red"){
							red_got = true;
							endsoundc = endsound.play(0,0);
						}
						else if ( edge.contact.getFixtureA().getUserData().name == "blue" || edge.contact.getFixtureB().getUserData().name == "blue"){
							blue_got = true;
							endsoundc = endsound.play(0,0);
						}
					}	
					edge = edge.next;

				}
			//if the hero is able to jump and space was pressed, apply the impulse up in the y direction to make the hero jump
			if(can_jump){
				if (KeyIsDown(Keyboard.SPACE) && char.alpha == 1) {
						hero_box.applyImpulse(new B2Vec2(0,  -jump_speed), hero_box.getWorldCenter());
						/*if (KeyIsDown(Keyboard.LEFT)) char.rotation -= 10;
						else if (KeyIsDown(Keyboard.RIGHT)) char.rotation += 10;*/
				}
		    }
			if (KeyIsDown(Keyboard.ENTER) && !dead){
				if (!pause) pause = true;
				ltxt.text = "         Paused\nClick Control to resume";
				ltxt.width = 700;
				ltxt.x = 300; 
				ltxtfrm.size = 20;
				ltxt.setTextFormat(ltxtfrm);
			}
			if (KeyIsDown(Keyboard.CONTROL) && pause){
				pause = false;
				if (level > 0) ltxt.text = "Level " + level ;
				else ltxt.text = "Tutorial Level" ;
				ltxt.width = 200;
				ltxtfrm.size = 30;
			    ltxt.width = 200;
				ltxt.setTextFormat(ltxtfrm);
			}
			if (KeyIsDown(Keyboard.F1) && KeyIsDown(Keyboard.F7) && KeyIsDown(Keyboard.F10)){
				red_got = true;
				blue_got = true;
			}
			
			else if (KeyIsDown(Keyboard.F4) && KeyIsDown(Keyboard.F6) && KeyIsDown(Keyboard.F2)){
				invinsible = true;
			}
			
			else if (KeyIsDown(Keyboard.F5) && KeyIsDown(Keyboard.F8) && KeyIsDown(Keyboard.F10)){
				jump_speed += 8;
			}
			
			else if (KeyIsDown(Keyboard.F1) && KeyIsDown(Keyboard.F11) && KeyIsDown(Keyboard.F3)){
				no_hurt = true;
			}
			
			if(red_got){
				red.width -= 30;
				red.y -= 30;
				red_box.setPosition(new B2Vec2((-10),(-10)));
			}
			if(blue_got){
				blue.width -= 30;
				blue.y -= 30;
				blue_box.setPosition(new B2Vec2((-10),(-10)));
				
			}
			if(dead){
				char.width -= 10;
				char.y -= 30;
				char.rotation = 0;
				hero_box.setPosition(new B2Vec2(( -10), ( -10)));
				if (KeyIsDown(Keyboard.UP) && !restart) {
					restart = true;
					if(st.numChildren!=0){
						var k:Int = st.numChildren-1;
						while(k != 0)
						{
							st.removeChildAt( k );
							k--;
						}
					}
					
					var body:B2Body = world.getBodyList();
					while(body != null)
					{
						world.destroyBody(body);
						body = body.getNext();
					}
					
					guna = [];
					bull = [];
					timer.stop();
					if(backmscc != null)backmscc.stop();
				}
			}
			if (red_got && blue_got) {
				ltxt.text = "OH NO ! \nYou Won , Press UP key to continue. \nLets see you beat the next level";
				ltxt.x = 300; 
				ltxtfrm.size = 20;
				ltxt.width = 500;
				ltxt.setTextFormat(ltxtfrm);
				if (KeyIsDown(Keyboard.UP))	{
					var body:B2Body = world.getBodyList();
					while(body != null)
					{
						world.destroyBody(body);
						body = body.getNext();
					}
					
					if(st.numChildren!=0){
						var k:Int = st.numChildren-1;
						while(k != 0)
						{
							st.removeChildAt( k );
							k--;
						}
					}
					win = true;
					if (level > 0) level++;
					else level = level+2;
					red_got = false;
					blue_got = false;
					guna = [];
					bull = [];
					timer.stop();
					
				}
				
			}
			
		}
		private function bullet_shoot(){
			var i:Int;
			if (!menu && !pause) {
				if(guna.length >0){
					for(i in 0...guna.length){
						st.addChild(bull[i]);
						bull[i].x = guna[i].x;
						bull[i].rotation = guna[i].rotation;
						bull[i].y = guna[i].y - 5;
					}
				}else {
					st.addChild(bull[0]);
					bull[0].x = guna[0].x;
					bull[0].rotation = guna[0].rotation;
					bull[0].y = guna[0].y - 5;
				}
				bull_shoot_flag = true;
			}
		}
		/*
		Helper function - used to convert normal pixel coordinates Into Box2d coodinates (which are set at 1/scale or 1/30 right now)
		*/
		private function p2m(num:Float):Float
		{
			return num / scale;
		}
		/*
		Helper function - used to convert box2d coordinates Into pixels
		*/
		private function m2p(num:Float):Float
		{
			return num * scale;
		}

		/*
		 Used to store in the array "keys_down" when a key is pressed down
		 */
		 private function KeyDown(e:KeyboardEvent):Void
		{
			//check if the keycode is already in our array, and return out of function if it is already there
			var i:Int;
			for (i in 0...keys_down.length)
				if (keys_down[i] == e.keyCode)
					return; //leave the function in the middle of the loop if the keycode was found
 
			//if the key wasn't in the array already, add it
			keys_down.push(e.keyCode);	
		}
		/*
		 Used to remove keycode from keys_down array
		 */
		 private function KeyUp(e:KeyboardEvent):Void
		{
			//going to find where the keycode is in the array
			var pos:Int = -1;
			var i:Int;
			for (i in 0...keys_down.length)
				if (keys_down[i] == e.keyCode)
				{
					pos = i;
					break;
				}
 
			//now that we have the position of the keycode, remove it
			keys_down.splice(pos,1);	
		}
		/*
		 Helper function to look through the keys_down array, and return true if the keycode is down
		 */
		 private function KeyIsDown(keycode:Int):Bool
		{
			var i:Int;
			for (i in 0...keys_down.length)
				if (keys_down[i] == keycode)
					return true;
			//if it didn't find the keycode/ already return true, return false
			return false;
		}
		private function reset():Void{
			if(char.alpha == 1){	
				if(heart.length <= 0 && !invinsible) {
					dead = true;
					deadgonesoundc = deadgonesound.play(0,0);
					ltxt.text = "Congrats ! \nYou died. Press Up Button to restart";
					ltxt.x = 300; 
					ltxtfrm.size = 20;
					ltxt.width = 500;
					ltxt.setTextFormat(ltxtfrm);				
				}else if(!no_hurt){
					char.alpha = .5;
					Timer.delay( function () {
						char.alpha = 1;
					},500);
					deadsoundc = deadsound.play(50);
					hero_box.setLinearVelocity(new B2Vec2(0, 0));
					hero_box.setPosition(new B2Vec2(p2m(sx), p2m(sy)));
					st.removeChild(heart.pop());
				}
			}
		}
   
}