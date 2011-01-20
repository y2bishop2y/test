//
//  RPGAppDelegate.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RPGViewController;

@interface RPGAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RPGViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RPGViewController *viewController;

@end

