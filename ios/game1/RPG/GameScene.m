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
#import "Animation.h"

@implementation GameScene


-(void)dealloc {
	[myImage  release];
	[myImage1 release];
	[myImage2 release];
	[packedSpriteSheet release];
	[spriteSheet release];
	
	[playerAnim release];
	[ghostAnim release];
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

		// Ghost animation
		
		// Grab the ghost sprite sheet from within the packed sprite sheet
		Image *ghostImages = [packedSpriteSheet imageForKey:@"ghost_spritesheet.png" ];
		
		// By scaling the image that is going to be used in the sprite sheet, you can create 
		// scaled animations.  The command below causes the ghost sprites to be doulbe their normal size
		ghostImages.scale = Scale2fMake(2.0f, 2.0f );
		
		// Create the sprte sheet using the ghost image we have just obtained
		SpriteSheet *ghostSprites = [SpriteSheet spriteSheetForImage:ghostImages 
															sheetKey:@"ghostImages" spriteSize:CGSizeMake(40,40) spacing:0 marging:0 ];
		
		// Create a new animation instance
		ghostAnim = [[Animation alloc] init];
		
		//Define how long each frame should be displayed before moving on. Each frame could have
		// its own delay, they do not all need to be the same
		float delay = 0.2f;
		
		// Add the frame of animation to the animation instance
		[ghostAnim addFrameWithImage:[ghostSprites spriteImageAtCoords:CGPointMake(0, 0)] delay:delay ];
		[ghostAnim addFrameWithImage:[ghostSprites spriteImageAtCoords:CGPointMake(1, 0)] delay:delay ];
		[ghostAnim addFrameWithImage:[ghostSprites spriteImageAtCoords:CGPointMake(2, 0)] delay:delay ];
		
		// Set the state and type of animation
		ghostAnim.state = kAnimationState_Running;
		ghostAnim.type  = kAnimationType_PingPong;
		
		// Player animation
		Image *playerImages = [packedSpriteSheet imageForKey:@"player_spritesheet.png"];
		
		
		// playerImages.scale = Scale2fMake(2.0f, 2.0f);
		
		// playerImages.rotationPoint = CGPointMake(20, 20);
		// playerImages.rotation = -45.0f;
		
		// Create sprite sheet using the image we have just obtained
		SpriteSheet *playerSprites = [SpriteSheet spriteSheetForImage:playerImages sheetKey:@"playerSprites" spriteSize:CGSizeMake(40, 40) spacing:0 marging:0 ];
									  
		// Create a new animation instance
		playerAnim = [[Animation alloc] init];
		
		delay = 0.1f;
		
		// Add the frames of the animation to the animation instance
		[playerAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(1, 2) ] delay:delay];
		[playerAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(2, 2) ] delay:delay];
		[playerAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(1, 2) ] delay:delay];
		[playerAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(3, 2) ] delay:delay];
		
	
		// Set the state and type of animation
		playerAnim.state = kAnimationState_Running;
		playerAnim.type  = kAnimationType_Repeating;
		
		
		// Nemo animation 
		SpriteSheet *nemoSprites = [SpriteSheet spriteSheetFromImageNamed:@"nemo" spriteSize:CGSizeMake(60,60) spacing:0 margin:0 imageFilter:GL_NEAREST ];
		
		/*
		nemoAnim = [[Animation alloc ] init ];
		
		delay = 0.2f;
		
		[nemoAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(1, 0) ] delay:delay];
		[nemoAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(2, 0) ] delay:delay];
		[nemoAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(3, 0) ] delay:delay];
		[nemoAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(4, 0) ] delay:delay];
		[nemoAnim addFrameWithImage:[playerSprites spriteImageAtCoords:CGPointMake(5, 0) ] delay:delay];
		*/

		[nemoSprites release];

		// Release the sprtesheets we created as we no longer need them
		[playerSprites release];
		[ghostSprites release];


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
	
	[ghostAnim updateWithDelta:aDelta ];
	// [playerAnim updateWithDelta:aDelta ];
	// [nemoAnim updateWithDelta:aDelta ];
}

- (void)renderScene
{
	[myImage2 renderCenteredAtPoint:CGPointMake(160,240) ];
	[myImage1 renderCenteredAtPoint:CGPointMake(50,100) ];
	[myImage  renderCenteredAtPoint:CGPointMake(270, 430) ];
	
	[ghostAnim renderCenteredAtPoint:CGPointMake(50, 400)];
	// [playerAnim renderCenteredAtPoint:CGPointMake(270, 75 ) ];
	// [nemoAnim renderCenteredAtPoint:CGPointMake(270, 75 ) ];
	
	[sharedImageRenderManager renderImages ];
}


@end
