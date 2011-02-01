//
//  GameScene.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//

#import "AbstractScene.h"
#import "Global.h"

@class Image;
@class ImageRenderManager;
@class PackedSpirteSheet;
@class SpriteSheet;
@class Animation;


@interface GameScene : AbstractScene {
	float  transY;
	Image *myImage;
	Image *myImage1;
	Image *myImage2;
	
	ImageRenderManager	*sharedImageRenderManager;
	float scaleAmount;
	
	PackedSpirteSheet	*packedSpriteSheet;
	SpriteSheet			*spriteSheet;
	
	Animation			*ghostAnim;
	Animation			*playerAnim;
	Animation			*nemoAnim;
	
}

@end
