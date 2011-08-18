//
//  FCShapeStyle.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCShapeStyle.h"


@implementation FCShapeStyle

@synthesize fillColor, strokeColor, strokeWidth;

- (void)dealloc
{
    [fillColor release];
    [strokeColor release];
    [strokeWidth release];
    [super dealloc];
}

@end
