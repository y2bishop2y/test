//
//  AbstractScene.m
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "AbstractScene.h"


@implementation AbstractScene


@synthesize sceneState;
@synthesize sceneAlpha;

- (void)updateSceneWithDelta:(GLfloat)aDelta {}
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {}
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {}
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {}
- (void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent*)event view:(UIView*)aView {}
- (void)updateWithAccelerometer:(UIAcceleration*)aAcceleration {}
- (void)transitionToSceneWithKey:(NSString*)aKey {}
- (void)renderScene {}


@end
