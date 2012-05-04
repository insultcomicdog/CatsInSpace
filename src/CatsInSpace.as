package
{
	import com.jam3media.text.BaseTextFormat;
	import com.jam3media.text.TextFactory;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import fonts.FuturaSTDBoldObl;
	
	import hud.GameTimer;
	import hud.events.GameTimerEvent;
	
	//import  com.quetwo.Arduino.ArduinoConnector;
	
	[SWF(frameRate=30,width=1024,height=768, backgroundColor="#000000")]
	public class CatsInSpace extends Sprite
	{
		
		private var espn:ESPNService;
		private var gameTimer:GameTimer;
		
		public function CatsInSpace()
		{
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		private function init():void{
			espn = new ESPNService();
			espn.addEventListener(ESPNEvent.TOP_HEADLINE, onNewESPNHeadLine);
			espn.getHeadline();
			
			gameTimer = new GameTimer();
			gameTimer.addEventListener(GameTimerEvent.GAME_OVER, onGameOver);
			this.addChild(gameTimer);
			gameTimer.start();
		}
		
		private function onGameOver(e:GameTimerEvent):void
		{
			// game over!!
			gameTimer.reset();
			gameTimer.start();
		}
		
		private function onNewESPNHeadLine(e:ESPNEvent):void
		{
			//trace("onNewESPNHeadLine", e.selection);
			var btf:BaseTextFormat = new BaseTextFormat();
			btf.width=950;
			btf.multiline=true;
			btf.autoSize = TextFieldAutoSize.LEFT;
			var headLine :TextField= TextFactory.getText(FuturaSTDBoldObl, btf,0xffffff, 80);
			headLine.htmlText = (e.selection);
			this.addChild(headLine);
			
			headLine.y=100;
			
			var temp:* = new CatsInSpaceSFX.Cat2;
			temp.play(); 
		}
	}
}