//
//  UIViewGradient.m
//  Button Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewGradient.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"

@implementation UIViewGradient
@synthesize viewStyle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawRect:rect withStyle:viewStyle context:currentContext];
    
}


@end
