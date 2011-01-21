//
//  GameController.m
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "GameController.h"
#import "GameScene.h"
#import "Common.h"

#pragma mark -
#pragma mark Private Interface

@implementation GameController (Private)

// Initialize the game
- (void)initGame;

@end

#pragma mark -
#pragma mark Public implementation

@implementation GameController

@synthesize currentScene;

// Make this class a singleton class
SYNTHESIZE_SINGLETON_FOR_CLASS(GameController);

- (void)dealloc
{
	[gameScenes release];
	[super dealloc];
}

- (id)init
{
	self = [super init];
	
	if ( self != nil ) {
		
		// Initialize the game
		currentScene = nil;
		[self initGame];
	}
	return self;
}

- (void)updateCurrentSceneWithDelta:(float)aDelta 
{
	[currentScene updateSceneWithDelta:aDelta];
}

- (void)renderCurrentScene
{
	// Render the current scene
	[currentScene renderScene];
}

#pragma mark -
#pragma mark Accelerometer

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
}

@end


#pragma mark -
#pragma mark Private implementation

@implementation GameController (Private)

-(void) initGame
{
	MNLOG(@"INFO - GameController: Starting game initialization.");
	
	// Initialize game scenes
	gameScenes = [[NSMutableDictionary alloc] initWithCapacity:5];
	
	AbstractScene *scene = [[GameScene alloc ] init ];
	
	[gameScenes setValue:scene forKey:@"game" ];
	[scene release];
	
	// Set the initial game scene
	currentScene = [gameScenes objectForKey:@"game"];
	
	MNLOG( @"INFO = GameController: Finished game initialization." );
}

@end


