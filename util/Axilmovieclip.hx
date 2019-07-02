package util;

import flash.display.Bitmap;
import flash.display.MovieClip;

class Axilmovieclip extends MovieClip{
	public function new(img:Bitmap,offx:Int,offy:Int) {
		super();
		img.x = offx;
		img.y = offy;
		this.addChild(img);		
    }
}