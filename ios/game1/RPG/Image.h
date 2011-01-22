//
//  Image.h
//  RPG
//
//  Created by Emiliano Berenbaum on 1/22/11.
//  Copyright 2011 MN Inc. All rights reserved.
//

#import "Global.h"

@class Texture2D;
@class TextureManager;
@class ImageRenderManager;
@class GameController;

// Image class is a wrapper around the Texture2D class, It holds
// important information about an image that can be rendered to the screen
// such as its dimensions, rotation, scale, color filter and texture coords.
// The texture coords allow an image to represent a subimage within
// The texture which then provides support for sprite sheets (texture atlases).

// To effect rotation,
// translation and scaling, this class transforms this image own matrix. This 
// allows to load the transformed vertices into the IVA so that they are rendered
// correctly based on the images scale, rotation and location.

// If an image is not rendered using the ImageRenderManager then the rendering is
// the responsibility of another class. In that instance the images rendering 
// details such as gemoetry and texture information can be retrieved using 
// the images ImageDetails structure
//

@interface Image : NSObject {

	// Singleton Managers
	TextureManage		*textureManager;		
	GameController		*sharedGameController;
	ImageRenderManager	*sharedImageRenderManager;
	
	// Image IVARS
	NSString		*imageFileName;
	NSString		*imageFileType;
	Texture2D		*texture;
	
	CGSize			fullTextureSize;
	CGSize			textureSize;
	CGSize			imageSize;
	CGSize			originalImageSize;
	
	CGSize			maxTextureSize;
	CGPoint			textureOffset;
	float			rotation;
	Scale2f			scale;
	BOOL			flipHorizontally;
	BOOL			flipVertically;
	NSUInteger		IVAIndex;
	GLuint			textureName;
	
	CGPoint			point;
	CGPoint			rotationPoint;
	Color4f			color;
	
	BOOL			dirty;							// Tracks ifthe image needs to be transformed before being rendered
	GLenum			minMagFilter;
	CGRect			subImageRectangle;
	CGSize			textureRation;
	
	// Render information
	ImageDetails	*imageDetails;
	float			matrix[9];

}

@property (nonatomic, retain) NSString *imageFileName;
@property (nonatomic, retain) NSString *imageFileType;
@property (nonatomic, retain) Texture2D *texture;
@property (nonatomic, assign) CGSize fullTextureSize;
@property (nonatomic, assign) CGSize textureSize;
@property (nonatomic, assign) CGSize textureRatio;
@property (nonatomic, assign) CGSize maxTextureSize;
@property (nonatomic, assign) NSUInteger IVAIndex;
@property (nonatomic, assign) GLuint textureName;
@property (nonatomic, assign) GLenum minMagFilter;
@property (nonatomic, assign) ImageDetails *imageDetails;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) CGPoint textureOffset;
@property (nonatomic, assign) float rotation;
@property (nonatomic, assign) Scale2f scale;
@property (nonatomic, assign) BOOL flipHorizontally;
@property (nonatomic, assign) BOOL flipVertically;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) Color4f color;
@property (nonatomic, assign) CGPoint rotationPoint;
@property (nonatomic, assign) CGRect subImageRectangle;


// Designed initializer that is used to creat a new Image instance. It takes the 
// name of the image file to e used as the texture within the image and also details
// about scale and imageFilter
- (id) initWithImageNamed: (NSString*) aName filter:(GLenum)aFilter;


// Initilaizer which also takes sub region information and initializer the image to only
// render a sub region of the texture. The sub region is defined using a CGRect and the 
// size of the image quad will match the size of the sub texture dimensions
- (id) initWithImageNamed:(NSString *)aName filter:(GLenum)aFilter subTexture:(CGRect)aSubTexture;


// Returns an image which represents the specified sub region in this image
- (Image*) subImageInRect: (CGRect)aRect;

// Returns a new Image instance that is a copy fo the current image. The caller is reponsible for 
// retaining the copy.
// "Duplicate" was used in this method name to stop static analyzer in Xcode from reporting an issue
// namely "Object with +0 retain count returned to caller where a +1 (owning) retain count is expected"
// if the word "Copy was used in the method name. BY convetnation a method that beings with alloc, new 
// or contains copy should return at object with a retain count of 1. This method should rturn an 
// autoreleased object as the caller is reponsible for owning it, so the word "Duplicate" was used in
// the methdo name to follow convention
- (Image*)imageDuplicate;


// Changes the dimensions of the iamge rendered based on the % values passed in. The values for 
// width and height should range from 0 to 100. This is the percentage of the total width and 
// heigh that will be rendered next time the image is rendered. These settings will stay in place
// until they are changed. This method simply changes the geometry and texture information for this 
// image causing a sub regino of the image to be rendered
- (void)setImageSizeToRender:(CGSize)aImageSize;

// Adds the current image index to the queue in the image render manager.
// render managers queue so that the image will be rendered  manger is
// next asked to render.
- (void)render;

- (void)renderAtPoint:(CGPoint)aPoint;


- (void) renderAtPoint:(CGPoint)aPoint scale:(Scale2f)aScale rotation:(float)aRotation;

- (void)renderAtCenter;

- (void)renderCenterAtPoint:(CGPoint)aPoint;

- (void)renderCenteredAtPointP:(CGPoint)aPoint scale:(Scale2f) rotation:(float)aRotation;


@end
