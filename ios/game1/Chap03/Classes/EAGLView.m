//
//  EAGLView.m
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "EAGLView.h"
#import "ES1Renderer.h"

@implementation EAGLView

@synthesize animating;
@dynamic	animationFrameInterval;

// You must implement this method
+ (Class)layerClass
{
    return [CAEAGLLayer class];
}

//The EAGL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:.
- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
	if (self)
    {
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
        
        eaglLayer.opaque = TRUE;
        eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking,
                                        kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat,
                                        nil];
		
		renderer = [[ES1Renderer alloc ] init ];
		
		if ( !renderer )
		{
			[self release];
			return nil;
		}
		animating			   = FALSE;
		displayLinkSupported   = FALSE;
		animationFrameInterval = 1;
		displayLink			   = nil;
		animationTimer		   = nil;
		
		NSString *reqSysVer  = @"3.1";
		NSString *currSysVer = [[UIDevice currentDevice] systemVersion];
		
		if ( [currSysVer compare:reqSysVer options: NSNumericSearch ] != NSOrderedAscending) 
		{
			displayLinkSupported = TRUE;
		}
		
		
    }
    
    return self;
}

-(void) drawView:(id)sender
{
	[renderer render];
}

-(void)layoutSubviews
{
	[renderer resizeFromLayer: (CAEAGLLayer*)self.layer];
	[self drawView:nil];
}


-(NSInteger)animationFrameInterval
{
	return animationFrameInterval;
}

-(void)setAnimationFrameInterval:(NSInteger)frameInterval
{
	
	// Frame interval defines how many display frames must pass between each time the 
	// display link fires. The display link will only fire 30 times a second when the 
	// frame interval is two on a display that refreshes 60 times a second. The default
	// frame interval setting of one will fire 60 times a second when the display refreshes
	// at 60 times a second. A frame interval setting of less than one results in undefined 
	// hehavior
	if (frameInterval >= 1 ) {
		
		animationFrameInterval = frameInterval;
		
		if ( animating ) 
		{
			[self stopAnimation ];
			[self startAnimation];
		}
	}
}


-(void) startAnimation
{
	if ( !animating)
	{
		if (displayLinkSupported) {
			// CADsiplayLink is API new to to iphone 3.1. Compiling against earlier veresions 
			// will result in a warning, but can be dimissed if the system
			// version runtime check for CADisplayLink exists in -initWithCoder: 
			// The runtime check ensures this code will not be called 
			// in system versions earlier than 3.1 
			
			displayLink = [NSClassFromString(@"CADisplayLink")displayLinkWithTarget:self 
															selector:@selector(drawView:)];
			
			[displayLink setFrameInterval:animationFrameInterval];
			[displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
			
			 
		} else {
			
			animationTimer = [NSTimer
							  scheduledTimerWithTimeInterval:(NSTimeInterval)((1.0 / 60.0) * animationFrameInterval)
							  target:self
							  selector:@selector(drawView:)
							  userInfo:nil
							  repeats: TRUE ];
			
			animating = TRUE;
		}
	}
}

-(void)stopAnimation
{
	if (animating)
	{
		if(displayLinkSupported)
		{
			[displayLink invalidate];
			displayLink = nil;
		}
		else
		{
			[animationTimer invalidate];
			animationTimer = nil;
		}
		animating = FALSE;
	}
}

- (void)dealloc
{
	[renderer release];
    
    [super dealloc];
}


@end
