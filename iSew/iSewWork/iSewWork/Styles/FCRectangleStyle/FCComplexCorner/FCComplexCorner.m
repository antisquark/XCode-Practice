//
//  FCComplexCorner.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCComplexCorner.h"


@implementation FCComplexCorner

@synthesize upperLeft, upperRight;
@synthesize lowerLeft, lowerRight;

+ (id)complexCornerWithScheme:(FCCornerScheme)cornerScheme
{
    return [[[self alloc] initWithScheme:cornerScheme] autorelease];
}

- (id)initWithScheme:(FCCornerScheme)cornerScheme
{
    self = [super init];
    if (self)
    {
        upperLeft = NO; upperRight = NO;
        lowerLeft = NO; lowerRight = NO;
        switch (cornerScheme) {
            case kFCCornerSchemeAll:
                upperLeft = YES; upperRight = YES;
                lowerLeft = YES; lowerRight = YES;
                break;
                
            case kFCCornerSchemeUpper:
                upperLeft = YES; upperRight = YES;
                break;
                
            case kFCCornerSchemeLower:
                lowerLeft = YES; lowerRight = YES;
                break;
                
            case kFCCornerSchemeLeft:
                upperLeft = YES; lowerLeft = YES;
                break;
                
            case kFCCornerSchemeRight:
                upperRight = YES; lowerRight = YES;
                break;
                
            default:
                break;
        }
    }
    return self;
}

@end
