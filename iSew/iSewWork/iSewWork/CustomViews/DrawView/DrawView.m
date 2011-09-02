//
//  DrawView.m
//  iSewWork
//
//  Created by Isaac Greenbride on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawView.h"
#import "FCScrollableChallengeButton.h"
#import "FCGraphicsAPI.h"

@implementation DrawView

- (id)init
{
    self = [super init];
    if (self) {
        [self setOpaque:NO];
        [self setBackgroundColor:[UIColor purpleColor]];
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    // Initialization code here.
    FCScrollableChallengeButton *cButton1 = [[FCScrollableChallengeButton alloc]init];
    CGRect buttonFrame =  CGRectMake(100, 100, 100, 150);
    cButton1.frame = buttonFrame;
    cButton1.stars = 3;
    cButton1.myImage = @"buttonIconTest.png";
    [self addSubview:cButton1];
    [cButton1 release];
    
    FCScrollableChallengeButton *cButton2 = [[FCScrollableChallengeButton alloc]init];
    buttonFrame =  CGRectMake(300, 100, 100, 150);
    cButton2.frame = buttonFrame;
    cButton2.stars = 2;
    cButton2.myImage = @"buttonIconTest.png";
    cButton2.LOCKED = TRUE;
    [self addSubview:cButton2];
    [cButton2 release];
    
    FCScrollableChallengeButton *cButton3= [[FCScrollableChallengeButton alloc]init];
    buttonFrame =  CGRectMake(100, 300, 200, 300);
    cButton3.frame = buttonFrame;
    cButton3.stars = 4;
    cButton3.myImage = @"buttonIconTest.png";
    cButton3.LOCKED = TRUE;
    [self addSubview:cButton3];
    [cButton3 release];
}

- (void) dealloc
{
    [super dealloc];
}

@end
