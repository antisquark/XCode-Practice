//
//  FCGradientStyle.h
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCShapeStyle.h"


typedef enum
{
    kFCGradientHorizontal,
    kFCGradientVertical,
    kFCGradientRadial
}
FCGradientType;

@interface FCGradientStyle : FCShapeStyle 
{
    
}

@property (nonatomic, retain) UIColor *gradientColor;
@property (nonatomic, retain) UIColor *strokeGradientColor;
@property (nonatomic, assign) int fillType, strokeType;
@property (nonatomic, assign) int rotation;

@end
