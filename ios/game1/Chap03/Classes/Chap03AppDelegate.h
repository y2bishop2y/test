//
//  Chap03AppDelegate.h
//  Chap03
//
//  Created by Emiliano Berenbaum on 1/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Chap03ViewController;
@class EAGLView;

@interface Chap03AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	EAGLView *glView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet EAGLView *glView;



@end

