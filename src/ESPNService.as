package 
{
	import com.jam3media.utils.FileAir;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class ESPNService extends EventDispatcher
	{
		private var loader:URLLoader;
		private var apiKey:String="ghcz9fppuhy8knnyyuvb79dn";
		private var url:String="http://api.espn.com/v1/sports/news/headlines/top";
		
		//http://api.espn.com/v1/sports/news/headlines/top?apikey=ghcz9fppuhy8knnyyuvb79dn

		
		public function ESPNService()
		{
			
		}
		
		public function getHeadline():void{
			loader = new URLLoader();
			loader.addEventListener( Event.COMPLETE, dataLoaded );
			loader.addEventListener( IOErrorEvent.IO_ERROR, ioErrorHandler);
			
			var request:URLRequest;
			request = new URLRequest( url + "?apikey=" + apiKey );
			request.method = "GET";
			
			loader.load( request );

		}
		
		protected function ioErrorHandler(event:IOErrorEvent):void
		{
			trace( "ioErrorHandler", this, event );
			var customHeadline:String = "OH SHIT,<br>" + "CAN'T CONNECT TO ESPN, CHECK YOUR INTERNETS!"
			
			this.dispatchEvent(new ESPNEvent(ESPNEvent.TOP_HEADLINE, customHeadline.toUpperCase()));
		}

		
		private function dataLoaded(results:String):void {
			//trace( "dataLoaded" , this, JSON.parse( loader.data ) );
			var espData:Object = JSON.parse( loader.data );
			var headlineArr:Array = espData.headlines;
			
			var len:int = headlineArr.length;
			
			for (var i:int=0;i<headlineArr.length;i++){
				trace("headlineArr[i].headline", headlineArr[i].headline);
			}
			
			var randHeadline:String = headlineArr[Math.floor(Math.random()*len)].headline;
			var customHeadline:String = "OH SHIT,<br>" + randHeadline + " AND IT WAS AWESOESME"

			this.dispatchEvent(new ESPNEvent(ESPNEvent.TOP_HEADLINE, customHeadline.toUpperCase()));
		}
	}
}