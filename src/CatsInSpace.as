package
{
	import away3d.cameras.SpringCam;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.render.DefaultRenderer;
	import away3d.entities.Sprite3D;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.SphereGeometry;
	import away3d.textures.BitmapTexture;
	import away3d.textures.Texture2DBase;
	
	import com.jam3media.text.BaseTextFormat;
	import com.jam3media.text.TextFactory;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.textures.TextureBase;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import fonts.FuturaSTDBoldObl;
	
	import hud.GameTimer;
	import hud.events.GameTimerEvent;
	
	//import  com.quetwo.Arduino.ArduinoConnector;
	
	[SWF(frameRate=30,width=4096,height=1024, backgroundColor="#000000")]
	public class CatsInSpace extends Sprite
	{
		
		private var espn:ESPNService;
		private var gameTimer:GameTimer;
		
		
		private var scene:Scene3D; 
		private var camera:SpringCam;
		private var renderIt:DefaultRenderer;
		private var view:View3D;
		
		private var cat:Sprite3D;
		
		
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
			
			stage.scaleMode=StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 24;
			stage.color = 0x0;
			
			var pic:Bitmap = new CatsInSpaceGraphics.NEBULA;
			this.addChild(pic);
			
			
			espn = new ESPNService();
			espn.addEventListener(ESPNEvent.TOP_HEADLINE, onNewESPNHeadLine);
			espn.getHeadline();
			
			gameTimer = new GameTimer();
			gameTimer.addEventListener(GameTimerEvent.GAME_OVER, onGameOver);
			this.addChild(gameTimer);
			gameTimer.start();
			
			scene = new Scene3D();
			camera =  new SpringCam();
			renderIt = new DefaultRenderer();
			view= new View3D(scene, camera, renderIt);
			this.addChildAt(view,0);
			
			scene.addChild(CatsInSpaceSprite3DFactory.randomCatSprite);
			
			addEventListener(Event.ENTER_FRAME, renderScene);
		 
		}
		
		protected function renderScene(event:Event):void
		{
			view.render();
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