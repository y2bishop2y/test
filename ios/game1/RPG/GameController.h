//
//  GameController.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import <OpenGLES/ES1/gl.h>
#import "SynthesizeSingleton.h"

@class AbstractScene;

// Class responsible for managing the games overall state and game
// scenes.

@interface GameController : NSObject<UIAccelerometerDelegate> {
	
	// Dictionary of the different game scenes
	NSDictionary *gameScenes;
	
	// Current scene
	AbstractScene *currentScene;
}

@property (nonatomic, retain) AbstractScene *currentScene;

// Class method to return an instance of GameController. This is needed as 
// this class is  a singleton class
+ (GameController *)sharedGameController;

// Updates the logic within the current scene
- (void)updateCurrentSceneWithDelta:(float)aDelta;

// Render the current scene
- (void)renderCurrentScene;

@end
