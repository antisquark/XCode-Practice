//
//  FCDecalScrollableBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCDecalScrollableBg.h"
#import "FCScrollableBg.h"
#import "FCGraphicsAPI.h"
#import "FCScrollableBg.h"
#import "JewelView.h"

@implementation FCDecalScrollableBg
@synthesize jewelColor;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        jewelColor = JEWEL_CREDIT_COLOR;    //defaults to the orange?
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGRect topRect = CGRectMake(rect.origin.x+BG_CONTENTS_INSET, 
                                rect.origin.y+BG_CONTENTS_INSET, 
                                rect.size.width-2*BG_CONTENTS_INSET, 
                                (rect.size.height-2*BG_CONTENTS_INSET)/super.topHeightFractionOfTotal);
    
    CGRect middleRect = CGRectMake(BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   topRect.origin.y + topRect.size.height + BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   rect.size.width-2*BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   rect.size.height -2*BG_INTERNAL_DEFAULT_VERTICAL_SPACER - 2*BG_CONTENTS_INSET - topRect.size.height - JEWEL_HEIGHT);
    
    CGRect bottomRect = CGRectMake(rect.size.width-BG_INTERNAL_DEFAULT_VERTICAL_SPACER - JEWEL_WIDTH,
                                   middleRect.origin.y + middleRect.size.height + BG_INTERNAL_DEFAULT_VERTICAL_SPACER, 
                                   JEWEL_WIDTH, JEWEL_HEIGHT);
    
    //draw the frame under the rest
    //    viewRectStyle.style = viewFrameStyle;
    [FCGraphicsAPI drawRect:rect withStyle:super.viewFrameRStyle context:currentContext];
    //draw the top box
    [FCGraphicsAPI drawRect:topRect withStyle:super.viewTopRStyle context:currentContext];
    
    //draw this rectangle below the first and let it fill the rest of the frame.
    ////there was a single line of pixels between the two boxes, hence the -1 in the y value below
    //    viewRectStyle.style = viewBottomStyle;
    [FCGraphicsAPI drawRect:middleRect withStyle:super.viewMiddleRStyle context:currentContext]; 
    
    
    JewelView *bottomView = [[JewelView alloc]initWithFrame:bottomRect];
    bottomView.colorInt = jewelColor;//JEWEL_CASH_COLOR;
    [bottomView setOpaque:NO];
    [self addSubview:bottomView];
    [bottomView release];
    
}

@end
