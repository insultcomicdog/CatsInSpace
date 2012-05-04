package hud.events
{
	import flash.events.Event;

	public class GameTimerEvent extends Event
	{
		
		public static var GAME_START:String = "game_start";
		public static var GAME_OVER:String = "game_over";
			
		private var _selection:String;

		
		public function GameTimerEvent(type:String, selection:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			_selection = selection;
		}
		
		public function get selection():String {
			return _selection
		}
	}
}