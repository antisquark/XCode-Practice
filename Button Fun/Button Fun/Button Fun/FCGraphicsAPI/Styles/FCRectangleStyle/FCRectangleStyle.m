//
//  FCRectangleStyle.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCRectangleStyle.h"
#import "FCComplexCorner.h"


@implementation FCRectangleStyle

@synthesize style, cornerRadius, complexCorner;

- (id)init
{
    self = [super init];
    if (self)
    {
        style = nil;
        cornerRadius = [[NSNumber alloc] initWithInt:0];
        complexCorner = [[FCComplexCorner alloc] initWithScheme:kFCCornerSchemeAll];
    }
    return self;
}

- (void)dealloc
{
    [style release];
    [cornerRadius release];
    [complexCorner release];
    [super dealloc];
}

@end
