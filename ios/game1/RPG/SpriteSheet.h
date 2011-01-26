//
//  SpriteSheet.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/25/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "Global.h"
#import "Image.h"

@class TextureManager;
@class Image;

// This class represents a sprite sheet object. A sprite sheet 
// is a large image that contains a number of smaller sub images. Each of these smaller sub-images
// normally have the same dimessions in a simple sheet.  When you create a sprit sheet you specify
// the width and height of the sub-images within the texture and if there is any spacing between
// these images or margin. Once instantiated, you are then able to request a specific image from
// the sprite sheet using the imges X and Y coordinates
@interface SpriteSheet : NSObject {
	
	Image			*image;
	CGSize			spriteSize;
	NSUInteger		spacing;
	NSUInteger		margin;
	NSUInteger		horizSpriteCount;
	NSUInteger		vertSpriteCount;
	NSMutableArray *cachedSprites;		// Array that holds the cached sprite images

}

@property (nonatomic, assign, readonly) CGSize spriteSize;
@property (nonatomic, assign, readonly) NSUInteger spacing;
@property (nonatomic, assign, readonly) NSUInteger margin;
@property (nonatomic, assign, readonly) NSUInteger horizSpriteCount;
@property (nonatomic, assign, readonly) NSUInteger vertSpriteCount;
@property (nonatomic, retain) Image *image;


// Class method that allows us to cahce sprite sheets that are created by providing
// an images file name.  This class should be used to get a sprite sheet rahter than the initializer
// if you want to make use of the cached sprite sheets
+ (SpriteSheet*)spriteSheetFromImageNamed:(NSString*)aImageName spriteSize:(CGSize)aSpriteSize
								  spacing:(NSUInteger)aSpacing margin:(NSUInteger)aMargin imageFilter:(GLenum)aFilter;


// Class method that allows us to cache sprite sheets that are created by providing an image instance.
// This class should be used to get a sprite sheet rather than the initializer if you want to make 
// use of the cached sprte sheet
+ (SpriteSheet*)spriteSheetForImage:(Image*)aImage sheetKey:(NSString*)aSheetKey spriteSize:(CGSize)aSpriteSize
							spacing:(NSInteger)aSpacing marging:(NSUInteger)aMargin;

// Class method used to remove a cached sprite sheet with the provided key
+ (BOOL) removeCachedSpriteSheetWithKey:(NSString*)aKey;

// Designated initializer used to create a new sprite sheet
- (id) initWithImageNamed: (NSString*)aIMageFileName spriteSize:(CGSize)aSpriteSize spacing:(NSUInteger)aSpacing
				   margin:(NSUInteger)aMarging imageFilter:(GLenum)aFilter;

// Initialize the sprite sheet using an Image instance rather than taking the image file name
- (id) initWithImage:(Image*)aImage spriteSize:(CGSize)aSpriteSize spacing:(NSUInteger)aSpacing margin:(NSUInteger)aMargin;

// Returns an image which represents the sprite at the given coordinates
- (Image*)spriteImageAtCoords:(CGPoint)aPoint;



@end
