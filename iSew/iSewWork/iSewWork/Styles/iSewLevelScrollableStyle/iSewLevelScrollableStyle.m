//
//  iSewLevelScrollableStyle.m
//  iSewWork
//
//  Created by Isaac Greenbride on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "iSewLevelScrollableStyle.h"

@implementation iSewLevelScrollableStyle

@synthesize outerBoxFillColor, imageBoxFillColor, starBarFillColor, starFillColor;
@synthesize outerBoxStrokeColor, imageBoxStrokeColor, starStrokeColor;
@synthesize outerBoxStrokeWidth, imageBoxStrokeWidth, starStrokeWidth;
@synthesize cornerRadius;
- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}
- (void)dealloc
{
    [outerBoxFillColor  release];
    [imageBoxFillColor release];
    [starBarFillColor release];
    [starFillColor release];
    [imageBoxStrokeColor release];
    [starStrokeColor release];
    [imageBoxStrokeWidth release];
    [starStrokeWidth release];
    [cornerRadius release];
    [super dealloc];
}

@end
