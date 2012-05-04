package
{
	public class CatsInSpaceGraphics
	{
		
		
		//cats
		[Embed(source="assets/graphics/cats/beigecat.png")]
		public static var  BEIGE_CAT:Class;
		
		[Embed(source="assets/graphics/cats/beigekeyboard.png")]
		public static var  BEIGE_KEYBOARD:Class;
		
		[Embed(source="assets/graphics/cats/beigecatkeyboard.png")]
		public static var  BEIGE_CAT_KEYBOARD:Class;
		
		
		[Embed(source="assets/graphics/cats/blackcat.png")]
		public static var  BLACK_CAT:Class;
		
		[Embed(source="assets/graphics/cats/blackkeyboard.png")]
		public static var  BLACK_KEYBOARD:Class;
		
		[Embed(source="assets/graphics/cats/blackcatkeyboard.png")]
		public static var  BLACK_CAT_KEYBOARD:Class;
		
		
		[Embed(source="assets/graphics/cats/bluecat.png")]
		public static var  BLUE_CAT:Class;
		
		[Embed(source="assets/graphics/cats/bluekeyboard.png")]
		public static var  BLUE_KEYBOARD:Class;
		
		[Embed(source="assets/graphics/cats/bluecatkeyboard.png")]
		public static var  BLUE_CAT_KEYBOARD:Class;
		
	
		[Embed(source="assets/graphics/cats/redcat.png")]
		public static var  RED_CAT:Class;
		
		[Embed(source="assets/graphics/cats/redkeyboard.png")]
		public static var  RED_KEYBOARD:Class;
		
		[Embed(source="assets/graphics/cats/redcatkeyboard.png")]
		public static var  RED_CAT_KEYBOARD:Class;
		
		
		[Embed(source="assets/graphics/cats/yellowcat.png")]
		public static var  YELLOW_CAT:Class;
		
		[Embed(source="assets/graphics/cats/yellowkeyboard.png")]
		public static var  YELLOW_KEYBOARD:Class;
		
		[Embed(source="assets/graphics/cats/yellowcatkeyboard.png")]
		public static var  YELLOW_CAT_KEYBOARD:Class;
		
		
		//hud
		[Embed(source="assets/graphics/hud/crosshair.png")]
		public static var  CROSS_HAIR:Class;
		
		
		//modals
		[Embed(source="assets/graphics/modals/startscreen.png")]
		public static var  START_SCREEN:Class;
		
		[Embed(source="assets/graphics/modals/instructions.png")]
		public static var  INSTRUCTIONS:Class;
		
		[Embed(source="assets/graphics/modals/endscreen.png")]
		public static var  ENDSCREEN:Class;
		
		public static var catArray:Array=[BEIGE_CAT, BLACK_CAT, BLUE_CAT, RED_CAT, YELLOW_CAT ];
		public static var keyBoardArray:Array=[BEIGE_KEYBOARD, BLACK_KEYBOARD,BLUE_KEYBOARD, RED_KEYBOARD, YELLOW_KEYBOARD];
		public static var keyBoardAndCatArray:Array=[BEIGE_CAT_KEYBOARD,BLACK_CAT_KEYBOARD, BLUE_CAT_KEYBOARD, RED_CAT_KEYBOARD, YELLOW_CAT_KEYBOARD];
		
		//bg
		[Embed(source="assets/graphics/nebula.png")]
		public static var  NEBULA:Class;
		
		public function CatsInSpaceGraphics()
		{
		}
	}
}