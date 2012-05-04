package hud
{
	import com.jam3media.text.BaseTextFormat;
	import com.jam3media.text.TextFactory;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.Timer;
	
	import fonts.FuturaSTDBoldObl;
	
	import hud.events.GameTimerEvent;

	public class GameTimer extends Sprite
	{
		
		private var timeCopy:TextField;
		private var timeCounter:TextField;
		private var gameTimer:Timer ;
		private var bg:Shape;
		
		public function GameTimer()
		{
			init();
		}
		
		private function init():void{
			var btf:BaseTextFormat = new BaseTextFormat();
			btf.multiline=false;
			btf.autoSize = TextFieldAutoSize.LEFT;
			timeCopy= TextFactory.getText(FuturaSTDBoldObl, btf,0xffffff, 34);
			timeCopy.text="TIME:"
			this.addChild(timeCopy);
			
			timeCounter= TextFactory.getText(FuturaSTDBoldObl, btf,0x00fac5, 34);
			timeCounter.text="60"
			this.addChild(timeCounter);
			
			timeCounter.x = timeCopy.x+timeCopy.width;
			
			bg = new Shape();
			bg.graphics.beginFill(0x000000,1);
			bg.graphics.drawRect(0,0,timeCopy.width+timeCopy.width-35, timeCopy.height);
			bg.graphics.endFill();
			this.addChildAt(bg, 0);
			
			gameTimer = new Timer(1000,60);
			
			
			
			gameTimer.addEventListener(TimerEvent.TIMER,onTimerUpdate);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComplete);
		}
		
		private function onTimerComplete(event:TimerEvent):void
		{
			this.dispatchEvent(new GameTimerEvent(GameTimerEvent.GAME_OVER));
		}
		
		public function start():void{
			gameTimer.start();
		}
		
		public function reset():void{
			gameTimer.reset();
			timeCounter.text="60";
		}
		
		private function onTimerUpdate(event:TimerEvent):void{
			trace(String((60-gameTimer.currentCount)));
			timeCounter.text=String((60-gameTimer.currentCount));
//			if (myTimer.currentCount == 60) {
//				myTimer.reset();
//				myTimer.start();
//			}
		}
	}
}