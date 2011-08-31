//
//  DrawView2.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawView2.h"
//Rush View Style Files
#import "FCCheckInCaptionBg.h"
#import "FCCheckInDetailsBg.h"
#import "FCCustomTabsBg.h"
#import "FCButtonBg.h"
#import "FCConfirmationBg.h"
#import "FCGrayOut.h"
#import "FCGrayText.h"
#import "FCSignIn.h"
#import "FCSignInLabel.h"
#import "FCInviteBg.h"
#import "FCInviteNewBg.h"
#import "FCStorePhotosZeroResultsBg.h"
//
@implementation DrawView2
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        FCCheckInDetailsBg *checkInDetailView = [[FCCheckInDetailsBg alloc]initWithSize:CGSizeMake(0, 0)];
        FCCheckInCaptionBg *checkInCaptionView = [[FCCheckInCaptionBg alloc]initWithSize:CGSizeMake(300, 0)];
        FCGrayOut *grayOutView = [[FCGrayOut alloc]initWithSize:CGSizeMake(200, 0)];
        FCGrayText *grayTextView = [[FCGrayText alloc]initWithSize:CGSizeMake(300, 0)];
        FCSignIn *signIn = [[FCSignIn alloc]initWithSize:CGSizeMake(100, 500)];
        FCSignInLabel *signInLabel = [[FCSignInLabel alloc]initWithSize:CGSizeMake(50, 800)];
        FCInviteBg *inviteBg = [[FCInviteBg alloc]initWithSize:CGSizeMake(300, 200)];
        FCInviteNewBg *inviteNewBg  = [[FCInviteNewBg alloc]initWithSize:CGSizeMake(400, 400)];
        FCStorePhotosZeroResultsBg *storePhotosZeroResultsBg = [[FCStorePhotosZeroResultsBg alloc]initWithSize:CGSizeMake(20, 900)];
        FCConfirmationBg *confirmationBg = [[FCConfirmationBg alloc] initWithSize:CGSizeMake(0, 0)];
        FCCustomTabsBg *customTabsBg = [[FCCustomTabsBg alloc]initWithSize:CGSizeMake(40, 60)];
        
        [self addSubview:checkInCaptionView];
        [self addSubview:checkInDetailView];
        [self addSubview:grayTextView];
        [self addSubview:grayOutView];
        [self addSubview:signIn];
        [self addSubview:inviteBg];
        [self addSubview:inviteNewBg];
        [self addSubview:signInLabel];
        [self addSubview:storePhotosZeroResultsBg];
        [self addSubview:confirmationBg];
        [self addSubview:customTabsBg];
        
        [self setBackgroundColor:[UIColor greenColor]];
        //
        
    }    return self;
}

//not sure if this is the right place for statusLabel dealloc--> ASK
-(void)dealloc
{
    [super dealloc];        //will this interfere with the ViewController dealloc?
}

@end