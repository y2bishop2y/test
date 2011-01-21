//
//  ES1Renderer.h
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ESRenderer.h"
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import "Common.h"

@class GameController;

@interface ES1Renderer : NSObject<ESRenderer> 
{
@private	
	EAGLContext *context;
	
	//-- The pixel dimensions of the CAEAGLLayer
	GLint backingWidth;
	GLint backingHeight;
	
	//-- The OpenGL names for the framebuffer and 
	//-- renderbuffer used to render to this view
	GLuint defaultFramebuffer;
	GLuint colorRenderbuffer;
	
	// Shared Game controller
	GameController *sharedGameController;

}

- (void) render;
- (BOOL) resizeFromLayer:(CAEAGLLayer *)layer;

@end
