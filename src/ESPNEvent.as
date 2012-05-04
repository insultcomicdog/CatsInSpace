package
{
	import flash.events.Event;

	public class ESPNEvent extends Event
	{
		public static var TOP_HEADLINE:String = "top_headline"
			
		private var _selection:String;

		
		public function ESPNEvent(type:String, selection:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_selection = selection;
		}
		
		public function get selection():String {
			return _selection
		}
	}
}