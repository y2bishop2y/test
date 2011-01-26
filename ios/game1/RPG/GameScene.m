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
		
		// Set the velocity of the moving image.  This will cause the image to move 50 pixels per second
		velocity = CGPointMake( 50, 50 );
		
		// Set the initial position;
		point = CGPointMake( 160, 240 );
	}
	return self;
}



- (void) updateSceneWithDelta:(float)aDelta 
{
	float xScale = myImage.scale.x + scaleAmount * aDelta;
	float yScale = myImage.scale.y + scaleAmount * aDelta;
	
	myImage.scale			= Scale2fMake(xScale, yScale);
	myImage.rotationPoint	= CGPointMake( 45 * myImage.scale.x, 15 * myImage.scale.y );
	myImage.rotation		= myImage.rotation -= 360 * aDelta;
	
	if ( myImage.scale.x >= 2 || myImage.scale.x <= 1 ) {
		
		scaleAmount *= -1;
	}
	// Calculate a new position based on the velocity
	point.x += velocity.x * aDelta;
	point.y += velocity.y * aDelta;
	
	// Rever the velocity if we go beyond the bonds of the screen
	if ( point.x > 320 || point.x < 0) {
		velocity.x = -velocity.x;
	}
	
	if ( point.y > 480 || point.y < 0 ) {
		velocity.y = -velocity.y;
	}
	
	
}

- (void)renderScene
{
	[myImage1 renderCenteredAtPoint:CGPointMake(160,240) ];
	[myImage  renderCenteredAtPoint:point ];
	[sharedImageRenderManager renderImages ];
}


@end
