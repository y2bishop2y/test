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

@implementation GameScene

- (id) init
{
	self = [super init];
	
	if ( self != nil ) 
	{
		sharedImageRenderManager = [ImageRenderManager sharedImageRenderManager];
		
		myImage = [[Image alloc] initWithImageNamed:@"knight.gif" filter:GL_LINEAR];
		myImage.color = Color4fMake(1.0, 0.5, 0.5, 0.75	);
		
		myImage1 = [[Image alloc] initWithImageNamed:@"knight.gif" filter:GL_LINEAR];
		scaleAmount = 2;
	}
	return self;
}



- (void) updateSceneWithDelta:(float)aDelta 
{
	float xScale = myImage.scale.x + scaleAmount + aDelta;
	float yScale = myImage.scale.y + scaleAmount + aDelta;
	
	myImage.scale = Scale2fMake(xScale, yScale);
	myImage.rotationPoint = CGPointMake( 45 * myImage.scale.x, 15 * myImage.scale.y );
	myImage.rotation      = myImage.rotation -= 180 * aDelta;
	
	if ( myImage.scale.x >= 5 || myImage.scale.x <= 1 ) {
		
		scaleAmount += -1;
	}
	
	
}

- (void)renderScene
{
	[myImage1 renderCenteredAtPoint:CGPointMake(160,240) ];
	[myImage  renderCenteredAtPoint:CGPointMake(160, 240) ];
	[sharedImageRenderManager renderImages ];
}


@end
