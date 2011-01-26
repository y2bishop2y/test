//
//  GameScene.m
//  CH04_SLQTSOR
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 Michael Daley. All rights reserved.
//

#import "GameScene.h"
#import "Image.h"
#import "ImageRenderManager.h"
#import "SpriteSheet.h"
#import "PackedSpirteSheet.h"

@implementation GameScene


-(void)dealloc {
	[myImage  release];
	[myImage1 release];
	[myImage2 release];
	[packedSpriteSheet release];
	[spriteSheet release];
	
	[super dealloc];
}

- (id) init
{
	self = [super init];
	
	if ( self != nil ) 
	{
		sharedImageRenderManager = [ImageRenderManager sharedImageRenderManager];
		
		// set the speed at which the imge should scale. This will increase
		// the scale or the image by 3 per second
		scaleAmount = 3;
		
		packedSpriteSheet = [[PackedSpirteSheet alloc] initWithImageNamed:@"atlas.png" controlFile:@"coordinates" filter:GL_NEAREST];
		
		Image *spriteSheetImage = [packedSpriteSheet imageForKey:@"player_spritesheet.png" ];
		
		spriteSheet = [SpriteSheet spriteSheetForImage:spriteSheetImage sheetKey:@"spriteSheet" spriteSize:CGSizeMake(40,40) spacing:0 marging:0 ];

		// spriteSheet = [SpriteSheet spriteSheetFromImageNamed:@"player_spritesheet.png" spriteSize:CGSizeMake(40,40) spacing:0 margin:0 imageFilter:GL_NEAREST ];
		
		// Create three images by taking three different images from the sprite sheet
		
		myImage  = [[spriteSheet spriteImageAtCoords:CGPointMake(2, 2)] retain];
		myImage1 = [[spriteSheet spriteImageAtCoords:CGPointMake(0, 0)] retain];
		myImage2 = [[spriteSheet spriteImageAtCoords:CGPointMake(1, 3)] retain];
		
		// Set the scale of myImage1
		myImage1.scale = Scale2fMake(2,4);
		
		myImage.color = Color4fMake(1.0, 0.5, 0.5, 1.0f);
	
	}
	return self;
}



- (void) updateSceneWithDelta:(float)aDelta 
{
	float xScale = myImage.scale.x + scaleAmount * aDelta;
	float yScale = myImage.scale.y + scaleAmount * aDelta;
	
	myImage.scale = Scale2fMake(xScale, yScale);
	
	myImage.rotationPoint = CGPointMake(20 * myImage.scale.x, 20 * myImage.scale.y);
	
	// This will rotate the image by 360 degrees per second
	myImage.rotation = myImage.rotation -= 360 * aDelta;
	
	// Revers the scaling factor when we reach the limits defined below
	if ( myImage.scale.x >=  5 || myImage.scale.x <= 1 ) {
		
		scaleAmount *= -1;
	}
	
}

- (void)renderScene
{
	[myImage2 renderCenteredAtPoint:CGPointMake(160,240) ];
	[myImage1 renderCenteredAtPoint:CGPointMake(50,100) ];
	[myImage  renderCenteredAtPoint:CGPointMake(270, 430) ];
	
	[sharedImageRenderManager renderImages ];
}


@end
