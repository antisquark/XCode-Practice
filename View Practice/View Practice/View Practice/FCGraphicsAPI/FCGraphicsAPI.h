//
//  FCGraphicsAPI.h
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"
//#import "FCBitmapStyle.h" // deprecated
#import "FCRectangleStyle.h"
#import "FCComplexCorner.h"


typedef enum
{
    kFCTriangleUp,
    kFCTriangleDown,
    kFCTriangleLeft,
    kFCTriangleRight
}
FCTriangleOrientation;

@interface FCGraphicsAPI : NSObject
{
    
}

+ (FCGraphicsAPI *)sharedGraphics;

// drawing
+ (void)drawRect:(CGRect)aRect withStyle:(FCRectangleStyle *)aStyle context:(CGContextRef)aContext;
+ (void)drawEllipse:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle context:(CGContextRef)aContext;
+ (void)drawTriangle:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle orientation:(FCTriangleOrientation)orientation context:(CGContextRef)aContext;
+ (void)drawPlus:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle cornerRadius:(float)aCornerRadius context:(CGContextRef)aContext;

// colors
+ (UIColor *)UIColorFromRGB:(int)rgbValue withAlpha:(float)colorAlpha;
+ (UIColor *)UIColorFromRGB:(int)rgbValue;
+ (UIColor *)UIColorFromString:(NSString *)stringToConvert;
+ (UIColor *)randomColor;
+ (UIColor *)randomColorWithAlpha:(float)colorAlpha;

@end
