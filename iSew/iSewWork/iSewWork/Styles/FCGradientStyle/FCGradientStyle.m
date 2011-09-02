//
//  FCGradientStyle.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCGradientStyle.h"


@implementation FCGradientStyle

@synthesize gradientColor, strokeGradientColor, fillType, strokeType, rotation;

- (id)init
{
    self = [super init];
    if (self)
    {
        gradientColor = nil;
        strokeGradientColor = nil;
    }
    return self;
}

- (void)dealloc
{
    [gradientColor release];
    [strokeGradientColor release];
    [super dealloc];
}

@end
