package util;

import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.display.Stage;
import flash.display.Bitmap;

class Util{
	public static function loadImage(inFilename:String)
    {
      var bytes = nme.utils.ByteArray.readFile(inFilename);
	  if (nme.utils.ByteArray.readFile(inFilename) == null) { 
		//neko.Lib.print("Error ! Cannot find specified file : " + inFilename + " using substitute file.");
		bytes = nme.utils.ByteArray.readFile("Lib/img/unknown.png");
	  }else {
		bytes = nme.utils.ByteArray.readFile(inFilename);  
	  }
	  
	  return BitmapData.loadFromBytes(bytes);
    }
	
	public static function getData(data:String)
    {
      var fin:String = decryp(neko.io.File.getContent("Lib/data/data.brgd"));
	  
	  var mdata = data + "<";
	  var ni:Int = fin.indexOf(mdata) + mdata.length;
	 	 
	  var nf:Int = fin.indexOf(">" + data +";");
	  var value:String = "";
	  
	  var i:Int = ni;
	  
	  for (i in ni...nf) { value += fin.charAt(i); }
	  
	  return value;
    }
	
	public static function writeData(data:String, value:String) {
	  	
	  var fin:String = decryp(neko.io.File.getContent("Lib/data/data.brgd"));
	  
	  var mdata = data + "<";
	   
	  var ni:Int = fin.indexOf(mdata) + mdata.length;
	  var nf:Int = fin.indexOf(">" + data + ";");
	  var en = encryp(insStrAt(ni, value, fin, nf));
	  var fout = neko.io.File.write("Lib/data/data.brgd", false);
	  fout.writeString(en);
	  fout.close();
	}
	
	public static function insStrAt(pos:Int, ins:String,str:String,posf:Int) {
		var tstr:String;
		tstr = str.substr(0, pos) + ins + str.substr(posf);
		return tstr;
	}
	
	public static function encryp(str:String):String
	{
		var i:Int = 0;
		var strn:String="";
		for (i in 0...str.length)
		{
			if (String.fromCharCode(str.charCodeAt(i) + 25) != String.fromCharCode(-62)) 
			{
				strn += String.fromCharCode(str.charCodeAt(i) + 25);
			}
		}
		return StringTools.replace(strn, String.fromCharCode( -62), "");
	}
	
	public static function decryp(str:String):String
	{
		var i:Int = 0;
		var strn:String="";
		for (i in 0...str.length)
		{
			strn += String.fromCharCode(str.charCodeAt(i) - 25);
		}
		return strn;
	}
	
}