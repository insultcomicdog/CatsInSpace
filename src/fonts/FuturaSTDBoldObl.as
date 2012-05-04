package fonts
{
	import flash.text.Font;
	
	[Embed(source='../../_fonts/FuturaStd-BoldOblique.otf', 
		fontName='futurastbold', 
		fontFamily='futurastb', 
		fontWeight="normal",
		fontStyle="normal",
		mimeType="application/x-font-opentype", 
		unicodeRange="U+0021-U+007E, U+00C0-U+00FF,U+2122,U+00AE"
	)]
	
	public class FuturaSTDBoldObl extends Font
	{
		public function FuturaSTDBoldObl()
		{
			super();
		}
	}
}