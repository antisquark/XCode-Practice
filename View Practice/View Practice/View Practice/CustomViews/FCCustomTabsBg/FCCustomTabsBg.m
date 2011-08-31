//
//  FCCustomTabsBg.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
/*
 Should I be making these styles a class variable? I mean, they're not altered for the draw method--does ever instance need their own copy?
 */
/*
 customTabs_bkgd:
 - stroke: #9F3B62
 - fill: top gradient (#F4247C - #E11570) bottom gradient (#D60252 - #BF0046)
 320x48
 */
#import "FCCustomTabsBg.h"
#import "FCGraphicsAPI.h"
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"
#import "FCGradientStyle.h"

@implementation FCCustomTabsBg

@synthesize viewRectStyle;
@synthesize viewTopStyle;
@synthesize viewBottomStyle;
@synthesize viewFrameStyle;
@synthesize topHeightFractionOfTotal;

//- (id)initWithFrame:(CGRect)frame
//{
//    CGRect newFrame = CGRectMake(frame.origin.x, frame.origin.y, 320,48);
- (id)initWithSize:(CGSize)myOrigin
{
    CGRect newFrame = CGRectMake(myOrigin.width, myOrigin.height, 320,48);
    self = [super initWithFrame:newFrame];
    if (self) 
    {
        // Initialization code
        topHeightFractionOfTotal=1.99;
        
        viewRectStyle = [[FCRectangleStyle alloc]init];
        viewTopStyle = [[FCGradientStyle alloc]init];
        viewBottomStyle = [[FCGradientStyle alloc]init];
        viewFrameStyle = [[FCGradientStyle alloc] init];
        
        viewTopStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xF4247C];//E11570];//
        viewTopStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:0xE11570];//F4247C];//
        viewTopStyle.fillType = kFCGradientVertical;
        viewTopStyle.strokeColor = viewTopStyle.fillColor;
        viewTopStyle.strokeGradientColor = viewTopStyle.fillColor;
        
        viewBottomStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0xD60252];//BF0046];
        viewBottomStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:0xBF0046];//D60252];//BF0046];
        viewBottomStyle.fillType = kFCGradientVertical;
        viewBottomStyle.strokeColor = viewBottomStyle.fillColor;
        viewBottomStyle.strokeGradientColor = viewBottomStyle.fillColor;        
        
        viewFrameStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x9F3B62];//[UIColor clearColor];      
        
        [self setOpaque:NO];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //This is really only for the small pale line
    viewRectStyle.style = viewFrameStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y, 
                                       self.frame.size.width, self.frame.size.height) withStyle:viewRectStyle context:currentContext];
    
    //darkest square
    viewRectStyle.style = viewBottomStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y+1, self.frame.size.width, self.frame.size.height) withStyle:viewRectStyle context:currentContext];
    
    //draw this rectangle below the first and let it fill the rest of the frame.
    ////there was a single line of pixels between the two boxes, hence the -1 in the y value below
    viewRectStyle.style = viewTopStyle;
    [FCGraphicsAPI drawRect:CGRectMake(rect.origin.x, rect.origin.y+1, 
                                       self.frame.size.width, self.frame.size.height/topHeightFractionOfTotal) withStyle:viewRectStyle context:currentContext];   

    
}
-(void) dealloc 
{
    [super dealloc];
    //don't have to release the topHeight variable; it's just a float.
}
@end
