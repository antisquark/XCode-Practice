//
//  FCGraphicsAPI.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FCGraphicsAPI.h"


@interface FCGraphicsAPI ()

+ (void)renderStyle:(FCShapeStyle *)style withRect:(CGRect)rectangle asStroke:(BOOL)isStroke inContext:(CGContextRef)aContext;

@end

@implementation FCGraphicsAPI

static FCGraphicsAPI *graphicsAPI = nil;

+(FCGraphicsAPI *)sharedGraphics
{
    if(graphicsAPI == nil)
    {
        graphicsAPI = [[super allocWithZone:NULL] init];
    }
    
    return graphicsAPI;
}


+(id)allocWithZone:(NSZone *)zone
{
    return [[self sharedGraphics] retain];
}

-(id)copyWithZone:(NSZone *)zone
{
    return self;
}

-(id)retain
{
    return self;
}

-(NSUInteger)retainCount
{
    return NSUIntegerMax;
}

-(void)release
{
    
}

-(id)autorelease
{
    return self;
}

#pragma mark - Helpers

+ (void)renderStyle:(FCShapeStyle *)style withRect:(CGRect)rectangle asStroke:(BOOL)isStroke inContext:(CGContextRef)aContext
{
    CGFloat minx = CGRectGetMinX(rectangle), midx = CGRectGetMidX(rectangle), maxx = CGRectGetMaxX(rectangle);
    CGFloat miny = CGRectGetMinY(rectangle), midy = CGRectGetMidY(rectangle), maxy = CGRectGetMaxY(rectangle);
    
    // Draw gradient
    BOOL isDrawnWithGradient = NO;
    FCGradientStyle *gradientStyle = nil;
    CGPathDrawingMode drawingMode = isStroke ? kCGPathStroke : kCGPathFill;
    if ([style isKindOfClass:[FCGradientStyle class]])
    {
        gradientStyle = (FCGradientStyle *)style;
    }
    if (gradientStyle != nil)
    {
        if (gradientStyle.gradientColor != nil)//this should check EITHER gradient color OR stroke gradient color, depending on which is drawing
        {
            int fillType;
            CGColorRef color1, color2;
            
            if (isStroke)
            {
                CGContextReplacePathWithStrokedPath(aContext);
                color1 = [gradientStyle.strokeColor CGColor];
                color2 = [gradientStyle.strokeGradientColor CGColor];
                fillType = gradientStyle.strokeType;
//                NSLog(@"isStroke true, strokeColor: %@", color1);
                //NSLog(@"isStroke true: %d", fillType);
            }
            else
            {
                color1 = [gradientStyle.fillColor CGColor];
                color2 = [gradientStyle.gradientColor CGColor];
                fillType = gradientStyle.fillType;
            }
            isDrawnWithGradient = YES;
            CGFloat locations[2] = { 0.0f, 1.0f };
            const CGFloat *startComponents = CGColorGetComponents(color1);
            const CGFloat *endComponents = CGColorGetComponents(color2);
            CGFloat components[8] = 
            {
                startComponents[0], startComponents[1], startComponents[2], startComponents[3],
                endComponents[0], endComponents[1], endComponents[2], endComponents[3]
            };
            CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
            
            CGContextClip(aContext);
            //fillType = 0;
//            NSLog(@"fillType %d", fillType);
            switch (fillType) {
                case kFCGradientRadial:
                {
//                    NSLog(@"radial");
                    CGPoint point = CGPointMake(midx, midy);
                    CGFloat startRadius = 0.0f;
                    CGFloat endRadius = MAX(maxx-minx, maxy-miny);
                    CGContextDrawRadialGradient(aContext, gradient, point, startRadius, point, endRadius, kCGGradientDrawsAfterEndLocation);
                } break;
                    
                case kFCGradientHorizontal:
                {
//                    NSLog(@"horizontal");
                    CGPoint startPoint = CGPointMake(minx-[style.strokeWidth floatValue]/2, midy);
                    CGPoint endPoint = CGPointMake(maxx+[style.strokeWidth floatValue]/2, midy);
                    CGContextDrawLinearGradient(aContext, gradient, startPoint, endPoint, 0);
                } break;
                    
                case kFCGradientVertical:
                {
//                    NSLog(@"vertical");
                    CGPoint startPoint = CGPointMake(midx, miny-[style.strokeWidth floatValue]/2);
                    CGPoint endPoint = CGPointMake(midx, maxy+[style.strokeWidth floatValue]/2);
                    CGContextDrawLinearGradient(aContext, gradient, startPoint, endPoint, 0);
                } break;
                
//                //ISAAC
//                case kFCGradientDirectional:
//                {
//                    NSLog(@"directional");
//                    CGPoint startPoint = CGPointMake(midx, miny-[style.strokeWidth floatValue]/2);
//                    CGPoint endPoint = CGPointMake(maxx, maxy+[style.strokeWidth floatValue]/2);
//                    CGContextDrawLinearGradient(aContext, gradient, startPoint, endPoint, 0);
//                    
//                }
                default:
//                    NSLog(@"Isaac's hunch");
                    break;
            }
            CGGradientRelease(gradient), gradient = nil;
            CGColorSpaceRelease(colorspace), colorspace = nil;
        }
    }
    // end drawing gradient
    
    if (!isDrawnWithGradient) CGContextDrawPath(aContext, drawingMode);
}

#pragma mark - Drawing

// -- draw rect --------------------------------

+ (void)drawRect:(CGRect)aRect withStyle:(FCRectangleStyle *)aStyle context:(CGContextRef)aContext
{
    FCShapeStyle *style = aStyle.style;
    

    
    CGRect rectangle = CGRectMake(aRect.origin.x + [style.strokeWidth floatValue]/2, aRect.origin.y + [style.strokeWidth floatValue]/2, aRect.size.width - [style.strokeWidth floatValue], aRect.size.height - [style.strokeWidth floatValue]);
    [style.fillColor setFill];
    [style.strokeColor setStroke];
    
    CGFloat minx = CGRectGetMinX(rectangle), midx = CGRectGetMidX(rectangle), maxx = CGRectGetMaxX(rectangle);
    CGFloat miny = CGRectGetMinY(rectangle), midy = CGRectGetMidY(rectangle), maxy = CGRectGetMaxY(rectangle);
    
    // FILL
    {
        CGContextSaveGState(aContext);
        
        // Rectangle outline
        CGContextSetLineWidth(aContext, [style.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        CGContextMoveToPoint(aContext, minx, midy);
        if (aStyle.complexCorner.upperLeft) CGContextAddArcToPoint(aContext, minx, miny, midx, miny, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, minx, miny, midx, miny, 0);
        if (aStyle.complexCorner.upperRight) CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, 0);
        if (aStyle.complexCorner.lowerRight) CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, 0);
        if (aStyle.complexCorner.lowerLeft) CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, 0);
        CGContextClosePath(aContext);
        // end Rectangle outline
        
        [self renderStyle:style withRect:rectangle asStroke:NO inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END FILL
    
    // STROKE
    {
        CGContextSaveGState(aContext);
        
        // Rectangle outline
        CGContextSetLineWidth(aContext, [style.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        CGContextMoveToPoint(aContext, minx, midy);
        if (aStyle.complexCorner.upperLeft) CGContextAddArcToPoint(aContext, minx, miny, midx, miny, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, minx, miny, midx, miny, 0);
        if (aStyle.complexCorner.upperRight) CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, maxx, miny, maxx, midy, 0);
        if (aStyle.complexCorner.lowerRight) CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, maxx, maxy, midx, maxy, 0);
        if (aStyle.complexCorner.lowerLeft) CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, [aStyle.cornerRadius floatValue]);
        else CGContextAddArcToPoint(aContext, minx, maxy, minx, midy, 0);
        CGContextClosePath(aContext);
        // end Rectangle outline
        
        [self renderStyle:style withRect:rectangle asStroke:YES inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END STROKE
}

// ----------------------------------------------------------

// -- draw ellipse ------------------------------------------

+ (void)drawEllipse:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle context:(CGContextRef)aContext
{
    CGRect rectangle = CGRectMake(aRect.origin.x + [aStyle.strokeWidth floatValue]/2, aRect.origin.y + [aStyle.strokeWidth floatValue]/2, aRect.size.width - [aStyle.strokeWidth floatValue], aRect.size.height - [aStyle.strokeWidth floatValue]);
    [aStyle.fillColor setFill];
    [aStyle.strokeColor setStroke];
    
    FCGradientStyle *gradientStyle = nil;
    if ([aStyle isKindOfClass:[FCGradientStyle class]])
    {
        gradientStyle = (FCGradientStyle *)aStyle;
    }
    
    // FILL
    {
        CGContextSaveGState(aContext);
        
        // Elipse outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        CGContextAddEllipseInRect(aContext, rectangle);
        CGContextClosePath(aContext);
        // end ellipse outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:NO inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END FILL
    
    // STROKE
    {
        CGContextSaveGState(aContext);
        
        // Ellipse outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        CGContextAddEllipseInRect(aContext, rectangle);
        CGContextClosePath(aContext);
        // end ellipse outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:YES inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END STROKE
}

// --------------------------------------------------------

// -- draw triangle --------------------------------------------

+ (void)drawTriangle:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle orientation:(FCTriangleOrientation)orientation context:(CGContextRef)aContext
{
    CGRect rectangle = CGRectMake(aRect.origin.x + [aStyle.strokeWidth floatValue]/2, aRect.origin.y + [aStyle.strokeWidth floatValue]/2, aRect.size.width - [aStyle.strokeWidth floatValue], aRect.size.height - [aStyle.strokeWidth floatValue]);
    [aStyle.fillColor setFill];
    [aStyle.strokeColor setStroke];
    
    FCGradientStyle *gradientStyle = nil;
    if ([aStyle isKindOfClass:[FCGradientStyle class]])
    {
        gradientStyle = (FCGradientStyle *)aStyle;
    }
    
    CGFloat minx = CGRectGetMinX(rectangle), midx = CGRectGetMidX(rectangle), maxx = CGRectGetMaxX(rectangle);
    CGFloat miny = CGRectGetMinY(rectangle), midy = CGRectGetMidY(rectangle), maxy = CGRectGetMaxY(rectangle);
    
    // FILL
    {
        CGContextSaveGState(aContext);
        
        // Triangle outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        switch (orientation) {
            case kFCTriangleUp:
                CGContextMoveToPoint(aContext, midx, miny);
                CGContextAddLineToPoint(aContext, maxx, maxy);
                CGContextAddLineToPoint(aContext, minx, maxy);
                break;
                
            case kFCTriangleDown:
                CGContextMoveToPoint(aContext, midx, maxy);
                CGContextAddLineToPoint(aContext, maxx, miny);
                CGContextAddLineToPoint(aContext, minx, miny);
                break;
                
            case kFCTriangleLeft:
                CGContextMoveToPoint(aContext, minx, midy);
                CGContextAddLineToPoint(aContext, maxx, miny);
                CGContextAddLineToPoint(aContext, maxx, maxy);
                break;
                
            case kFCTriangleRight:
                CGContextMoveToPoint(aContext, maxx, midy);
                CGContextAddLineToPoint(aContext, minx, miny);
                CGContextAddLineToPoint(aContext, minx, maxy);
                break;
                
            default:
                break;
        }
        CGContextClosePath(aContext);
        // end triangle outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:NO inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END FILL
    
    // STROKE
    {
        CGContextSaveGState(aContext);
        
        // Triangle outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        switch (orientation) {
            case kFCTriangleUp:
                CGContextMoveToPoint(aContext, midx, miny);
                CGContextAddLineToPoint(aContext, maxx, maxy);
                CGContextAddLineToPoint(aContext, minx, maxy);
                break;
                
            case kFCTriangleDown:
                CGContextMoveToPoint(aContext, midx, maxy);
                CGContextAddLineToPoint(aContext, maxx, miny);
                CGContextAddLineToPoint(aContext, minx, miny);
                break;
                
            case kFCTriangleLeft:
                CGContextMoveToPoint(aContext, minx, midy);
                CGContextAddLineToPoint(aContext, maxx, miny);
                CGContextAddLineToPoint(aContext, maxx, maxy);
                break;
                
            case kFCTriangleRight:
                CGContextMoveToPoint(aContext, maxx, midy);
                CGContextAddLineToPoint(aContext, minx, miny);
                CGContextAddLineToPoint(aContext, minx, maxy);
                break;
                
            default:
                break;
        }
        CGContextClosePath(aContext);
        // end triangle outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:YES inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END STROKE
}

// ------------------------------------------------------------

// -- draw plus -------------------------------------------------

+ (void)drawPlus:(CGRect)aRect withStyle:(FCShapeStyle *)aStyle cornerRadius:(float)aCornerRadius context:(CGContextRef)aContext
{
    CGRect rectangle = CGRectMake(aRect.origin.x + [aStyle.strokeWidth floatValue]/2, aRect.origin.y + [aStyle.strokeWidth floatValue]/2, aRect.size.width - [aStyle.strokeWidth floatValue], aRect.size.height - [aStyle.strokeWidth floatValue]);
    [aStyle.fillColor setFill];
    [aStyle.strokeColor setStroke];
    
    FCGradientStyle *gradientStyle = nil;
    if ([aStyle isKindOfClass:[FCGradientStyle class]])
    {
        gradientStyle = (FCGradientStyle *)aStyle;
    }
    
    CGFloat minx = CGRectGetMinX(rectangle), midx = CGRectGetMidX(rectangle), maxx = CGRectGetMaxX(rectangle);
    CGFloat miny = CGRectGetMinY(rectangle), midy = CGRectGetMidY(rectangle), maxy = CGRectGetMaxY(rectangle);
    
    // FILL
    {
        CGContextSaveGState(aContext);
        
        // Plus outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        float plusWidth = (maxx - minx) / 8;
        float plusHeight = (maxy - miny) / 8;
        if (aCornerRadius > MIN(plusWidth, plusHeight)) aCornerRadius = MIN(plusWidth, plusHeight);
        CGContextMoveToPoint(aContext, minx, midy);
        CGContextAddArcToPoint(aContext, minx, midy-plusHeight, midx-(plusWidth*3/2), midy-plusHeight, aCornerRadius);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy-plusHeight);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy-(plusHeight*3/2));
        CGContextAddArcToPoint(aContext, midx-plusWidth, miny, midx, miny, aCornerRadius);
        CGContextAddArcToPoint(aContext, midx+plusWidth, miny, midx+plusWidth, midy-(plusHeight*3/2), aCornerRadius);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy-plusHeight);
        CGContextAddLineToPoint(aContext, midx+(plusWidth*3/2), midy-plusHeight);
        CGContextAddArcToPoint(aContext, maxx, midy-plusHeight, maxx, midy, aCornerRadius);
        CGContextAddArcToPoint(aContext, maxx, midy+plusHeight, midx+(plusWidth*3/2), midy+plusHeight, aCornerRadius);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy+plusHeight);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy+(plusHeight*3/2));
        CGContextAddArcToPoint(aContext, midx+plusWidth, maxy, midx, maxy, aCornerRadius);
        CGContextAddArcToPoint(aContext, midx-plusWidth, maxy, midx-plusWidth, midy+(plusHeight*3/2), aCornerRadius);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy+plusHeight);
        CGContextAddLineToPoint(aContext, midx-(plusWidth * 3/2), midy+plusHeight);
        CGContextAddArcToPoint(aContext, minx, midy+plusHeight, minx, midy, aCornerRadius);
        CGContextClosePath(aContext);
        // end plus outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:NO inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END FILL
    
    // STROKE
    {
        CGContextSaveGState(aContext);
        
        // Plus outline
        CGContextSetLineWidth(aContext, [aStyle.strokeWidth floatValue]);
        
        CGContextBeginPath(aContext);
        float plusWidth = (maxx - minx) / 8;
        float plusHeight = (maxy - miny) / 8;
        if (aCornerRadius > MIN(plusWidth, plusHeight)) aCornerRadius = MIN(plusWidth, plusHeight);
        CGContextMoveToPoint(aContext, minx, midy);
        CGContextAddArcToPoint(aContext, minx, midy-plusHeight, midx-(plusWidth*3/2), midy-plusHeight, aCornerRadius);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy-plusHeight);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy-(plusHeight*3/2));
        CGContextAddArcToPoint(aContext, midx-plusWidth, miny, midx, miny, aCornerRadius);
        CGContextAddArcToPoint(aContext, midx+plusWidth, miny, midx+plusWidth, midy-(plusHeight*3/2), aCornerRadius);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy-plusHeight);
        CGContextAddLineToPoint(aContext, midx+(plusWidth*3/2), midy-plusHeight);
        CGContextAddArcToPoint(aContext, maxx, midy-plusHeight, maxx, midy, aCornerRadius);
        CGContextAddArcToPoint(aContext, maxx, midy+plusHeight, midx+(plusWidth*3/2), midy+plusHeight, aCornerRadius);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy+plusHeight);
        CGContextAddLineToPoint(aContext, midx+plusWidth, midy+(plusHeight*3/2));
        CGContextAddArcToPoint(aContext, midx+plusWidth, maxy, midx, maxy, aCornerRadius);
        CGContextAddArcToPoint(aContext, midx-plusWidth, maxy, midx-plusWidth, midy+(plusHeight*3/2), aCornerRadius);
        CGContextAddLineToPoint(aContext, midx-plusWidth, midy+plusHeight);
        CGContextAddLineToPoint(aContext, midx-(plusWidth * 3/2), midy+plusHeight);
        CGContextAddArcToPoint(aContext, minx, midy+plusHeight, minx, midy, aCornerRadius);
        CGContextClosePath(aContext);
        // end plus outline
        
        [self renderStyle:aStyle withRect:rectangle asStroke:YES inContext:aContext];
        
        CGContextRestoreGState(aContext);
    }
    // END STROKE
}
// -------------------------------------------------------


#pragma mark - Colors

// -- color from rgb -------------------------------------

+ (UIColor *)UIColorFromRGB:(int)rgbValue withAlpha:(float)colorAlpha {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 
						   green:((float)((rgbValue & 0xFF00) >> 8))/255.0 
							blue:((float)(rgbValue & 0xFF))/255.0 
						   alpha:colorAlpha];
}

+(UIColor *)UIColorFromRGB:(int)rgbValue
{    
    return [self UIColorFromRGB:rgbValue withAlpha:1.0];
}

// ----------------------------------------------------

// -- color from string --------------------------------

+(UIColor *) UIColorFromString: (NSString *) stringToConvert
{
	NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	// String should be 6 or 8 characters
	if ([cString length] < 6) return [UIColor blackColor];
	// strip 0X if it appears
	if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
	if ([cString length] != 6) return [UIColor blackColor];
	// Separate into r, g, b substrings
	NSRange range;
	range.location = 0;
	range.length = 2;
	NSString *rString = [cString substringWithRange:range];
	range.location = 2;
	NSString *gString = [cString substringWithRange:range];
	range.location = 4;
	NSString *bString = [cString substringWithRange:range];
	// Scan values
	unsigned int r, g, b;
	[[NSScanner scannerWithString:rString] scanHexInt:&r];
	[[NSScanner scannerWithString:gString] scanHexInt:&g];
	[[NSScanner scannerWithString:bString] scanHexInt:&b];
	
	return [UIColor colorWithRed:((float) r / 255.0f)
						   green:((float) g / 255.0f)
							blue:((float) b / 255.0f)
						   alpha:1.0f];
}

// ----------------------------------------------------

// -- random color  --------------------------------

+(UIColor *)randomColor
{
    return [FCGraphicsAPI randomColorWithAlpha:1.0f];
}

// ---------------------------------------------------

// -- random color with alpha ------------------------

+(UIColor *)randomColorWithAlpha:(float)colorAlpha
{
    int randomCoreColor = arc4random() % 3;
    float randomRed = arc4random() % 100;
    float randomGreen = (arc4random() % 100);
    float randomBlue = (arc4random() % 100);
    
    // --- comment out for true randomness, currently generates bright colors only
    
    if(randomCoreColor < 1)
    {
        randomRed = 100.0f;
    }
    else if(randomCoreColor < 2)
    {
        randomGreen = 100.0f;
    }
    else if(randomCoreColor < 3)
    {
        randomBlue = 100.0f;
    }
    
    // ------
    
    
    return [UIColor colorWithRed:(randomRed / 100) green:(randomGreen / 100) blue:(randomBlue / 100) alpha:colorAlpha];
}

// ----------------------------------------------------

@end
