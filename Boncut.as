package  {
	import flash.text.TextField; //input, output
	import flash.display.MovieClip;
	import flash.display.StageQuality;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class Boncut extends MovieClip {
		
		private const appVersion:String = new String("v1.1");
		
		public function Boncut() { }
		
		public function startUp():void {
			stage.quality = StageQuality.BEST;
			iniText();
		}

		private function iniText():void { input.addEventListener(Event.CHANGE, letsDoIt) }

		private function letsDoIt(e:Event=null):void {
			if (input.text != null) {
				var rex:RegExp = /(\n|\r)/gi;
				var temp:String = new String(input.text);
				var temparr:Array = new Array();
				temparr = temp.split(rex);
				if (temparr[0] != "Tracklist:") { temp = "Tracklist:\n" }
				else { temp = "" }
				for (var rep:uint = 0; rep < temparr.length; rep++) { temp += applyModifiers(temparr[rep]) }
				output.text = temp;
			}
		}

		private function applyModifiers(temp:String):String {
			temp = removeNumbers(temp);
			return(temp);
		}

		private function removeNumbers(temp:String):String {
			if (temp.indexOf(". ") >= 0) { temp = temp.substr(temp.indexOf(". ")+2, temp.length) }
			return(temp);
		}
	}	
}
