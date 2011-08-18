//
//  DrawButton.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawButton.h"
#import "FCGraphicsAPI.h"

@implementation DrawButton
@synthesize buttonStyle;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawRect:rect withStyle:buttonStyle context:currentContext];
}


//should I add code to dealloc the buttonStyle here, or does that happen as part of dealloc-ing these objects?

@end
