//
//  EAGLView.h
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ESRenderer.h"

//#import <OpenGLES/ES1/gl.h>
//#import <OpenGLES/ES1/glext.h>
//#import <OpenGLES/ES2/gl.h>
//#import <OpenGLES/ES2/glext.h>

// This class wraps the CAEAGLLayer from CoreAnimation into a convenient UIView subclass.
// The view content is basically an EAGL surface you render your OpenGL scene into.
// Note that setting the view non-opaque will only work if the EAGL surface has an alpha channel.
@interface EAGLView : UIView
{
	id<ESRenderer>	renderer;
	BOOL			animating;
	BOOL			displayLinkSupported;
	NSInteger		animationFrameInterval;
	
	// Use of the CADisplayLink class is the preferred method for controlling your animation
	// timing. CADisplayLink will link to the main display and fire every vsync when added to a 
	// given run-loop.  The NSTime class is used only as fallback when running on a pre 3.1 devie 
	// where CADisplayLink isn't available.
	id				displayLink;
	NSTimer			*animationTimer;
	
    EAGLContext *context;
    
}

@property (readonly, nonatomic, getter=isAnimating) BOOL animating;
@property (nonatomic) NSInteger animationFrameInterval;

-(void) startAnimation;
-(void) stopAnimation;
-(void) drawView: (id) sender;

@end
