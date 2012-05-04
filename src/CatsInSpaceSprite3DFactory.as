package
{
	import away3d.entities.Sprite3D;
	import away3d.materials.TextureMaterial;
	import away3d.textures.BitmapTexture;
	
	import flash.display.Bitmap;

	public class CatsInSpaceSprite3DFactory
	{
		public function CatsInSpaceSprite3DFactory()
		{
			
		}
		
		public static function get randomCatSprite():Sprite3D{		
			var randNum:int = Math.round(Math.random()* CatsInSpaceGraphics.catArray.length);		
			var pic:Bitmap = new CatsInSpaceGraphics.catArray[randNum];
			var bitmapTexture:BitmapTexture = new BitmapTexture(pic.bitmapData)
			var mat:TextureMaterial = new TextureMaterial(bitmapTexture);
			var cat:Sprite3D ;
			return  cat=new Sprite3D(mat, 1024, 1024);
		}	
	}
}