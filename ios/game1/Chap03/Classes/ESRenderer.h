//
//  ESRenderer.h
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/EAGLDrawable.h>


@protocol ESRenderer <NSObject>

- (void) render;
- (BOOL) resizeFromLayer : (CAEAGLLayer*) layer;


@end
