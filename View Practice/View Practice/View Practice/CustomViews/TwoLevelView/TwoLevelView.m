//
//  TwoLevelView.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//defaults to the format of the FCSignInLabel but with undefined size

#import "TwoLevelView.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
//#define FRACTION 10


@implementation TwoLevelView
@synthesize viewRectStyle;
@synthesize viewTopStyle;
@synthesize viewBottomStyle;
@synthesize viewFrameStyle;
@synthesize topHeightFractionOfTotal;

- (id)initWithFrame:(CGRect)frame
{
//    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 320, 416);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        topHeightFractionOfTotal=10;
        
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewTopStyle = [[FCShapeStyle alloc]init];
        viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x8F0234];
//        viewBottomStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xFCE2E5];
        viewTopStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xFCE2E5]; //corrected from above?
        viewTopStyle.strokeWidth = [NSNumber numberWithInt:0];
        
        viewBottomStyle = [[FCShapeStyle alloc]init];
        viewBottomStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xFCE2E5];
        viewBottomStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xFCE2E5];
        viewBottomStyle.strokeWidth = [NSNumber numberWithInt:0];
        
        viewFrameStyle = [[FCShapeStyle alloc] init];
        viewFrameStyle.fillColor = [UIColor clearColor];
        viewFrameStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xBDAAAB];
        viewFrameStyle.strokeWidth = [NSNumber numberWithInt:1];
        
        
        [self setOpaque:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    viewRectStyle.style = viewTopStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y, self.frame.size.width, self.frame.size.height/topHeightFractionOfTotal) withStyle:viewRectStyle context:currentContext];
    
    //white stripe in the middle?
    
    //draw this rectangle below the first and let it fill the rest of the frame.
    ////there was a single line of pixels between the two boxes, hence the -1 in the y value below
    viewRectStyle.style = viewBottomStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y+self.frame.size.height/topHeightFractionOfTotal-1, 
                                       self.frame.size.width, self.frame.size.height*(topHeightFractionOfTotal-1)/topHeightFractionOfTotal) withStyle:viewRectStyle context:currentContext];   
    //draw the frame over the rest.. currently can overlay stroke in the interior
    viewRectStyle.style = viewFrameStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y, 
                                       self.frame.size.width, self.frame.size.height) withStyle:viewRectStyle context:currentContext];

}

-(void) dealloc 
{
    [viewRectStyle release];
    [viewTopStyle release];
    [viewBottomStyle release];
    [viewFrameStyle release];
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}

@end
