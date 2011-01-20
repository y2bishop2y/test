//
//  Chap03AppDelegate.m
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Chap03AppDelegate.h"
#import "EAGLView.h"

@implementation Chap03AppDelegate

@synthesize window;
@synthesize glView;


-(void)applicationDidFinishLaunching:(UIApplication *)application
{
	[glView startAnimation];
}

-(void)applicationWillResignActive:(UIApplication *)application
{
	[glView stopAnimation];
}

-(void)applicationDidBecomeActive:(UIApplication *)application
{
	[glView startAnimation];
}

-(void)applicationWillTerminate:(UIApplication *)application
{
	[glView stopAnimation];
}


- (void)dealloc
{
	[window release];
    [glView release];

    
    [super dealloc];
}

@end
