//
//  AbstractScene.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>


// Abstract class which contains the basis for any game scene
// which is going to be used. A game scene is a self contained class
// which is responsible for updating the logic and rendering the 
// screen for the current scene. It is simply a way to encapsulate
// a specific scenes code in a single class.
//
// The GameController controls which scene is the current scene and its is this 
// class which is updated and rendered during the game loop

@interface AbstractScene : NSObject {

	CGRect		screenBounds;
	uint        sceneState;
	GLfloat		sceneAlpha;
	NSString	*nextSceneKey;
	float		sceneFadeSpeed;
}

#pragma mark -
#pragma mark Properties

// This property allows for the scenes state to be altered
@property (nonatomic, assign) uint sceneState;

// This property allows for the scenes alpah to be changed.
@property (nonatomic, assign) GLfloat sceneAlpha;

#pragma mark -
#pragma mark Methods

// Selector to update the scene logic using [aDelat] which is passed in from
// the game loop
- (void) updateSceneWithDelta: (float)aDelta;

// Selector which renders a scene 
- (void) renderScene;

// Selector that enables a touchesBegan events location to be passed into a scene 
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView;
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView;
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView;
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView;

// Selector which enables accelerometer data to be passed into the scene.
- (void)updateWithAccelerometer:(UIAcceleration*)aAcceleration;


@end
