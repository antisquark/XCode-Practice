//
//  FCProgressStyle.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCProgressStyle.h"

@implementation FCProgressStyle

@synthesize progressStyle, remainingStyle;
- (id)init
{
    self = [super init];
    if (self)
    {
        progressStyle = nil;
        remainingStyle = nil;
    }
    return self;
}
- (void) dealloc 
{
    [progressStyle release];
    [remainingStyle release];
    [super dealloc];
}

@end
