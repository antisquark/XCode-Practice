//
//  DrawLabel.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//ISAAC this whole idea needs some more thought--if it's going to have one, access to a UILabel object has to be mediated somehow
//ask why inheriting from UILabel didn't seem to work!


#import "DrawLabel.h"
#import "FCGraphicsAPI.h"

@implementation DrawLabel
@synthesize labelStyle;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //[super drawRect:rect];  //draws behind the label
    //CGRect myRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    [FCGraphicsAPI drawRect:rect withStyle:labelStyle context:currentContext];
    [super drawRect:rect];
}

//should I add code to dealloc the labelStyle here, or does that happen as part of dealloc-ing these objects?

@end
