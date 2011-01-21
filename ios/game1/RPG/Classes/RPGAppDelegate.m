//
//  RPGAppDelegate.m
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RPGAppDelegate.h"
#import "EAGLView.h"

@implementation RPGAppDelegate

@synthesize window;
@synthesize glView;


- (void) applicationDidFinishLaunching:(UIApplication *)application
{
	[glView startAnimation];
}

- (void) applicationWillResignActive:(UIApplication *)application
{
	[glView stopAnimation];
}

- (void) applicationDidBecomeActive:(UIApplication *)application
{
	[glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	[glView stopAnimation];
}


- (void)dealloc
{
    [viewController release];
    [window release];
    
    [super dealloc];
}

@end
