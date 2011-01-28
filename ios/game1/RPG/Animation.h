//
//  Animation.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/27/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "Global.h"

enum {
    kAnimationState_Running = 0,
    kAnimationState_Stopped = 1
};

enum {
    kAnimationType_Repeating = 0,
    kAnimationType_PingPong = 1,
    kAnimationType_Once = 2
};

// This class represents a collection of frames which can be animated. The class
// allows for any number of images to be added to teh animation specifying the 
// image to be used for rthe image as well as how long the image should be displayed
// before moving to the next image.
//
@interface Animation : NSObject {

	NSUInteger		state;		// State of the animation;
	NSUInteger		type;
	NSInteger		direction;
	NSUInteger		maxFrames;
	NSInteger		currentFrame;
	AnimationFrame*	frames;			// Array of frames for this animation
	float			displayTime;	// Accumulates the time while a frame is displayed
	NSInteger		frameCount;		// Total frames within the animation
	NSUInteger		bounceFrame;	// Frame at which animation should repeate or pingpong 
}

@property (nonatomic, assign)			NSUInteger state;
@property (nonatomic, assign)			NSUInteger type;
@property (nonatomic, assign)			NSInteger currentFrame;
@property (nonatomic, assign)			NSUInteger bounceFrame;
@property (nonatomic, assign, readonly) NSInteger direction;
@property (nonatomic, assign, readonly) NSUInteger maxFrames;


// Designated initializer for the animation class which takes a capacity and 
// creates the necessary storage for this animation
- (id) init;

// adds a frame to the animation
- (void)addFrameWithImage:(Image*)aImage delay:(float)aDelay;

// Updates the animation causing the timer to be progressed and the animation to
// move as defined
- (void)updateWithDelta:(float)aDelta;

// Returns a pointer to the image for the current frame
- (Image*)currentFrameImage;

// Returns the image for the frame index provided
- (Image*)imageForFrame:(NSUInteger)aIndex;

// Sets the point of rotation for all images in the animation
- (void)rotationPoint:(CGPoint)aPoint;

// Render the animation at [aPoint]
- (void)renderAtPoint:(CGPoint)aPoint;

// Render the animation at [aPoint] with [aScale] and [aRotation]
- (void)renderAtPoint:(CGPoint)aPoint scale:(Scale2f)aScale rotation:(float)aRotation;

// Renders the animation centered at the [aPoint]
- (void)renderCenteredAtPoint:(CGPoint)aPoint;

// Renders the animation centered at [aPoint] with [aScale] and [aRotation]
- (void)renderCenteredAtPoint:(CGPoint)aPoint scale:(Scale2f)aScale rotation:(float)rotation;


@end
