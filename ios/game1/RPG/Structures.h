/*
 *  Structures.h
 *  RPG
 *
 *  Created by Emiliano Berenbaum on 1/22/11.
 *  Copyright 2011 MN Inc. All rights reserved.
 *
 */
#import <OpenGLES/ES1/gl.h>

@class Image;

#pragma mark -
#pragma mark Types

// Structure to hold the x and y scale
typedef struct {
	float x;
	float y;
} Scale2f;

// Structure that defines the elements which make up a color
typedef struct {
	float red;
	float green;
	float blue;
	float alpha;
} Color4f;

// Stores geometry texture and colour information for a single vertex
typedef struct {
	CGPoint geometryVertex;
	Color4f vertexColor;
	CGPoint textureVertex;
} TexturedColoredVertex;


// Stores 4 TexturedColorVertex structures needed to define a quad
typedef struct {
	TexturedColoredVertex vertex1;
	TexturedColoredVertex vertex2;
	TexturedColoredVertex vertex3;
	TexturedColoredVertex vertex4;	
} TexturedColoredQuad;

// Stores information about each image which is created. texturedColoredQuad
// holds the original zero origin quad for the image and the texturedColoredQuadIVA
// holds a pointer to the images entry within the IVA 
typedef struct {
	TexturedColoredQuad *texturedColoredQuad;
	TexturedColoredQuad *texturedColoredQuadIVA;
	GLuint				textureName;
	NSUInteger			renderIndex;
	
} ImageDetails;





