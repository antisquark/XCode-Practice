//
//  FCBitmapStyle.m
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCBitmapStyle.h"


@implementation FCBitmapStyle

@synthesize imageURL;

- (void)dealloc
{
    [imageURL release];
    [super dealloc];
}

@end
