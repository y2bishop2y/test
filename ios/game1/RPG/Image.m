//
//  Image.m
//  RPG
//
//  Created by Emiliano Berenbaum on 1/22/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "Image.h"
#import "Texture2D.h"
#import "TextureManager.h"
#import "ImageRenderManager.h"
#import "GameController.h"
#import "AbstractScene.h"
#import "Transform2D.h"

#pragma mark -
#pragma mark Private interface

@interface Image (Private)

// method which initalizes the common properties of the image.  This initializer specific
// properties are handled within their respective initializer. This method also grabs
// a reference to the render and resource managers
- (void) initializeImage:(NSString*)aName filter:(GLenum)aFilter;

// Method to initialize the image properties. This is used by all the initializers to create
// the image details structure and to register the image details with the render manager
- (void)initializeDetails;

@end

#pragma mark -
#pragma mark Public implementation


@implementation Image

@synthesize imageFileName;
@synthesize imageFileType;
@synthesize texture;
@synthesize fullTextureSize;
@synthesize textureSize;
@synthesize textureRatio;
@synthesize maxTextureSize;
@synthesize imageSize;
@synthesize textureOffset;
@synthesize rotation;
@synthesize scale;
@synthesize flipHorizontally;
@synthesize flipVertically;
@synthesize IVAIndex;
@synthesize textureName;
@synthesize point;
@synthesize color;
@synthesize rotationPoint;
@synthesize minMagFilter;
@synthesize imageDetails;
@synthesize subImageRectangle;

#pragma mark -
#pragma mark Deallocation

- (void)dealloc 
{
	if (texture) {
		[texture release];
	}
	
	if ( imageDetails ) {
		
		if (imageDetails->texturedColoredQuad) {
			
			free(imageDetails->texturedColoredQuad);
		}
		free(imageDetails);
	}
	[super dealloc];
}

#pragma mark -
#pragma mark Initializers

- (id) initWithImageNamed:(NSString *)aName filter:(GLenum)aFilter
{
	
}

@end
