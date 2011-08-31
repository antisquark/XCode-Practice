//
//  DrawView.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//This line should be updated only in the branch

#import "DrawView.h"
#import "FCGraphicsAPI.h"
//#import "UIViewGradient.h"
//#import "UIView3Mode.h"
//#import "FCReverseRoundedCornersView.h"
//#import "FCGradientStyle.h"
//#import "FCRectangleStyle.h"
////Rush View Style Files
//#import "FCCheckInCaptionBg.h"
//#import "FCCheckInDetailsBg.h"
//#import "FCCustomTabsBg.h"
//#import "FCButtonBg.h"
//#import "FCConfirmationBg.h"
//#import "FCGrayOut.h"
//#import "FCGrayText.h"
//#import "FCSignIn.h"
//#import "FCSignInLabel.h"
//#import "FCInviteBg.h"
//#import "FCInviteNewBg.h"
//#import "FCStorePhotosZeroResultsBg.h"
//
#import "FCScrollableBg.h"
#import "FCDecalScrollableBg.h"
#import "FCPackageScrollableBg.h"
//#import "JewelView.h"
#import "FCCircularProgressIndicator.h"
#import "FCProgressStyle.h"
#import "FCFancyCircularProgressIndicator.h"
#import "FCRaysView.h"
//


//Ahmed suggests using the UIScreen element to get info about the dimensions etc., but I don't see those properties in the UIScreen elt.

#define IPAD_MAX_WIDTH 768
#define IPAD_MAX_HEIGHT 1024
#define BUTTON_DEFAULT_HEIGHT 60
#define BUTTON_DEFAULT_WIDTH 200
#define BUTTON__Y_SPACING 20
#define BUTTON_X_SPACING 60
#define SHADOW_H_OFFSET 3
#define SHADOW_W_OFFSET 0
#define STROKE_DEFAULT_W 2
#define CORNER_DEFAULT_R 10
#define DARK_PINK 0xFF0099
#define MEDIUM_PINK 0xFF66FF
#define LIGHT_PINK 0xFF66FF
#define FADED_DARK_PINK 0xCC3366
#define FADED_MEDIUM_PINK 0xCC66CC
#define FADED_LIGHT_PINK 0xCC66CC


@implementation DrawView

- (void)buttonPressed:(id)sender
{
//    NSLog(@"ButtonPressed");
//    NSString *title = [sender titleForState:UIControlStateNormal];
//    NSString *newText = [[NSString alloc] initWithFormat:
//                         @"%@ button pressed.", title];
//    [newText release];
//    NSLog(@"%@ View Pressed at DrawView Level", sender);
//    [sender changeState];
    [sender startStop];
//    NSLog(@"Pressed returns to Draw level");
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        UIColor *expFadedDarkPink = [FCGraphicsAPI UIColorFromRGB:0xCC3366];
//        UIColor *expFadedMediumPink = [FCGraphicsAPI UIColorFromRGB:0xCC66CC];
//        UIColor *expFadedLightPink = [FCGraphicsAPI UIColorFromRGB:0xFFCCFF];
//        //Anything translucent should have an alpha of .5
//        
//        ////LoadingScreen Background View
//        /*
//         Haven't done anything yet with the order of the view.. should it be behind everything else? etc.
//         */
//        UIViewGradient *bkgdView = [[UIViewGradient alloc]initWithFrame:CGRectMake(0, 0, IPAD_MAX_WIDTH, IPAD_MAX_HEIGHT)];
//        FCGradientStyle *bkgdGradient = [[FCGradientStyle alloc]init];
//        bkgdGradient.fillColor = expFadedMediumPink;
//        bkgdGradient.gradientColor = expFadedDarkPink;
//        bkgdGradient.fillType = kFCGradientRadial;
//        //it would be better if omitting the following two properties simply resulted in it not being drawn, rather than an error.
//        bkgdGradient.strokeGradientColor = expFadedDarkPink;
//        bkgdGradient.strokeColor = expFadedMediumPink;
//        bkgdGradient.strokeType = kFCGradientVertical;
//        bkgdGradient.strokeWidth = [NSNumber numberWithInt:STROKE_DEFAULT_W];
//        FCRectangleStyle *bkgdRect = [[FCRectangleStyle alloc]init];
//        bkgdRect.style = bkgdGradient;
//        bkgdView.viewStyle = bkgdRect;
//        [self addSubview:bkgdView];
//        
//        //// 3 Mode View
//        //FIRST MODE
//        //Selected style
//        FCGradientStyle *selectedTStyle = [[FCGradientStyle alloc]init];
//        selectedTStyle.fillColor = expFadedMediumPink;
//        selectedTStyle.gradientColor = expFadedDarkPink;
//        selectedTStyle.fillType = kFCGradientVertical;
//        selectedTStyle.strokeColor = expFadedDarkPink;
//        selectedTStyle.strokeGradientColor = selectedTStyle.strokeColor;
//        //locked style
//        FCShapeStyle *lockedTStyle = [[FCShapeStyle alloc]init];
//        lockedTStyle.fillColor = [UIColor lightGrayColor];
//        lockedTStyle.strokeColor = [UIColor grayColor];
//        lockedTStyle.strokeWidth = [NSNumber numberWithInt:2];
//        //default style 
//        FCShapeStyle *defaultTStyle = [[FCShapeStyle alloc]init];
//        defaultTStyle.fillColor = expFadedLightPink;
//        defaultTStyle.strokeColor = expFadedMediumPink;
//        defaultTStyle.strokeWidth = [NSNumber numberWithInt:STROKE_DEFAULT_W];
//        
//        
//        //Rect Style creation
//        FCRectangleStyle *tRectD = [[FCRectangleStyle alloc]init];
//        tRectD.style = defaultTStyle;
//        tRectD.cornerRadius = [NSNumber numberWithInt:CORNER_DEFAULT_R];
//        
//        FCRectangleStyle *tRectL = [[FCRectangleStyle alloc]init];
//        tRectL.style = lockedTStyle;
//        tRectL.cornerRadius = [NSNumber numberWithInt:CORNER_DEFAULT_R];
//        
//        FCRectangleStyle *tRectS = [[FCRectangleStyle alloc]init];
//        tRectS.style = selectedTStyle;
//        tRectS.cornerRadius = [NSNumber numberWithInt:CORNER_DEFAULT_R];
//        FCComplexCorner *tRectSCorners = [[FCComplexCorner alloc]initWithScheme:kFCCornerSchemeUpper];
//        tRectS.complexCorner = tRectSCorners;
//        
//        //Now that we have all those styles set, we can finally create a view to use them.
//        UIView3Mode *tView1 = [[UIView3Mode alloc]initWithFrame:CGRectMake(0, 0, BUTTON_DEFAULT_WIDTH, BUTTON_DEFAULT_HEIGHT)];
//        tView1.rStyleDefault = tRectD;
//        tView1.rStyleLocked = tRectL;
//        tView1.rStyleSelected = tRectS;
//        tView1.viewState = kFCViewSelected;
//        
//        UIView3Mode *tView2 = [[UIView3Mode alloc]initWithFrame:CGRectMake(BUTTON_DEFAULT_WIDTH + BUTTON_X_SPACING, 0, BUTTON_DEFAULT_WIDTH, BUTTON_DEFAULT_HEIGHT)];
//        tView2.rStyleDefault = tRectD;
//        tView2.rStyleLocked = tRectL;
//        tView2.rStyleSelected = tRectS;
//        tView2.viewState = kFCViewLocked;
//        
//        UIView3Mode *tView3 = [[UIView3Mode alloc]initWithFrame:CGRectMake(BUTTON_DEFAULT_WIDTH*2 + BUTTON_X_SPACING*2, 0, BUTTON_DEFAULT_WIDTH, BUTTON_DEFAULT_HEIGHT)];
//        tView3.rStyleDefault = tRectD;
//        tView3.rStyleLocked = tRectL;
//        tView3.rStyleSelected = tRectS;
//        tView3.viewState = kFCViewDefault;
////        tView1.viewState = UIControlStateNormal;  //should transition to using this state
////        [tView1 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
////        [tView2 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
////        [tView3 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
//        
////        [tView1 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside]; 
////        [tView2 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
////        [tView3 addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
////        [self setBackgroundColor:[UIColor clearColor];
//        [self addSubview:tView1];
//        [self addSubview:tView2];
//        [self addSubview:tView3];
//        
//        
//        ////Inverse Rounded Corners
//        CGRect rRC_Rect = CGRectMake(0, BUTTON_DEFAULT_HEIGHT + BUTTON__Y_SPACING, 80, 80);
//        
//        FCShapeStyle *rRC_ShapeStyle = [[FCShapeStyle alloc]init];
//        rRC_ShapeStyle.fillColor = [UIColor redColor];//expFadedLightPink;
//        rRC_ShapeStyle.strokeColor = [UIColor redColor];
//        rRC_ShapeStyle.strokeWidth = [NSNumber numberWithInt:1];
//        
//        FCRectangleStyle *rRC_RectStyle = [[FCRectangleStyle alloc]init];
//        rRC_RectStyle.style = rRC_ShapeStyle;
//        rRC_RectStyle.cornerRadius = [NSNumber numberWithInt:20];
//        
//        FCReverseRoundedCornersView *rRCorners = [[FCReverseRoundedCornersView alloc]initWithFrame:rRC_Rect];
//        rRCorners.frameStyle=rRC_RectStyle;
//        [self addSubview:rRCorners];
//        [rRCorners setOpaque:NO];
        
        
//      
//        [tView1 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
//        [tView2 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
//        [tView3 setBackgroundColor:[UIColor clearColor]];   //not working inside the class..
       
        
//        //Rush View Styles
//        FCCheckInDetailsBg *checkInDetailView = [[FCCheckInDetailsBg alloc]initWithSize:CGSizeMake(0, 0)];
//        //        checkInDetailView.viewRectStyle.style.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"checkInDetails_bkgd.png"]]; 
//        FCCheckInCaptionBg *checkInCaptionView = [[FCCheckInCaptionBg alloc]initWithSize:CGSizeMake(300, 0)];
//        FCGrayOut *grayOutView = [[FCGrayOut alloc]initWithSize:CGSizeMake(200, 0)];
//        FCGrayText *grayTextView = [[FCGrayText alloc]initWithSize:CGSizeMake(300, 0)];
//        FCSignIn *signIn = [[FCSignIn alloc]initWithSize:CGSizeMake(100, 500)];
//        FCSignInLabel *signInLabel = [[FCSignInLabel alloc]initWithSize:CGSizeMake(50, 800)];
//        FCInviteBg *inviteBg = [[FCInviteBg alloc]initWithSize:CGSizeMake(300, 200)];
//        FCInviteNewBg *inviteNewBg  = [[FCInviteNewBg alloc]initWithSize:CGSizeMake(400, 400)];
//        FCStorePhotosZeroResultsBg *storePhotosZeroResultsBg = [[FCStorePhotosZeroResultsBg alloc]initWithSize:CGSizeMake(20, 900)];
//        FCConfirmationBg *confirmationBg = [[FCConfirmationBg alloc] initWithSize:CGSizeMake(0, 0)];
//        //        FCCustomTabsBg *customTabsBg = [[FCCustomTabsBg alloc]initWithSize:CGSizeMake(40, 60)];        
//        FCCustomTabsBg *customTabsBg = [[FCCustomTabsBg alloc]initWithSize:CGSizeMake(40, 60)];
//        
//        [self addSubview:checkInCaptionView];
//        [self addSubview:checkInDetailView];
//        [self addSubview:grayTextView];
//        [self addSubview:grayOutView];
//        [self addSubview:signIn];
//        [self addSubview:inviteBg];
//        [self addSubview:inviteNewBg];
//        [self addSubview:signInLabel];
//        [self addSubview:storePhotosZeroResultsBg];
//        [self addSubview:confirmationBg];
//        [self addSubview:customTabsBg];
        //        JewelView *bottomView = [[JewelView alloc]initWithFrame:CGRectMake(300, 700, 50, 30)];
        //        bottomView.colorInt = 0x0099FF;
        //        [bottomView setOpaque:NO];
        //        [self addSubview:bottomView];
        //        
        
        //FCScrollableBg
//        FCPackageScrollableBg *scrollablePackageBgCredit = [[FCPackageScrollableBg alloc]initWithFrame:CGRectMake(50, 350, 200, 300)];
//        scrollablePackageBgCredit.jewelColor = JEWEL_CREDIT_COLOR;
//        FCPackageScrollableBg *scrollablePackageBgDollar = [[FCPackageScrollableBg alloc]initWithFrame:CGRectMake(350, 350, 200, 300)];
//        scrollablePackageBgDollar.jewelColor = JEWEL_DOLLAR_COLOR;
//        [self addSubview:scrollablePackageBgCredit];
//        [self addSubview:scrollablePackageBgDollar];
//
//        FCDecalScrollableBg *scrollableDecalBgCredit = [[FCDecalScrollableBg alloc]initWithFrame:CGRectMake(50, 50, 200, 250)];
//        FCDecalScrollableBg *scrollableDecalBgDollar = [[FCDecalScrollableBg alloc]initWithFrame:CGRectMake(350, 50, 200, 250)];
//        scrollableDecalBgDollar.jewelColor = JEWEL_DOLLAR_COLOR;
//        scrollableDecalBgCredit.jewelColor = JEWEL_CREDIT_COLOR;
//        [self addSubview:scrollableDecalBgCredit];
//        [self addSubview:scrollableDecalBgDollar];
        
        //FC Timer View
//        FCCircularProgressIndicator *timerView = [[FCCircularProgressIndicator alloc]initWithSeconds:100];
//        timerView.frame = CGRectMake(0, 0, 200, 200);
//        timerView.currentTime =90;
////        if([timerView respondsToSelector:@selector(buttonPressed:)]) {
////            [timerView startStop:self];
////        }
////        [timerView touchesBegan:[[NSSet alloc]init] withEvent:UIControlEventTouchUpInside];
//
//        

//        FCCircularProgressIndicator *timerView2 = [[FCCircularProgressIndicator alloc]initWithSeconds:20];
//        FCShapeStyle *rStyle = [[FCShapeStyle alloc]init];
//        rStyle.strokeWidth = [NSNumber numberWithInt:10];
//        rStyle.strokeColor = [UIColor grayColor];
//        rStyle.fillColor = [UIColor blueColor];
////        FCProgressStyle *pStyles2 = [[FCProgressStyle alloc] init];
////        pStyles2.remainingStyle = rStyle;
////        timerView2.progressStyles = pStyles2;
//        timerView2.progressStyles.remainingStyle = rStyle;
//        timerView2.progressStyles.progressStyle.strokeWidth = [NSNumber numberWithInt:0];
//        timerView2.progressStyles.progressStyle.fillColor = [UIColor blueColor];
//        timerView2.frame = CGRectMake(200, 0, 300, 300);
//        timerView2.currentTime =17;
        
//        FCFancyCircularProgressIndicator *timerView3 = [[FCFancyCircularProgressIndicator alloc]initWithSeconds:20];
//        timerView3.frame = CGRectMake(400, 200, 200, 200);
//        timerView3.currentTime =20;
//        FCShapeStyle *pStyle = [[FCShapeStyle alloc]init];
//        pStyle.fillColor = [UIColor yellowColor];
//        pStyle.strokeWidth = [NSNumber numberWithInt:4];
//        pStyle.strokeColor = [UIColor greenColor];
//        FCProgressStyle *pStyles3 = [[FCProgressStyle alloc] init];
//        pStyles3.progressStyle = pStyle;
//        timerView3.progressStyles = pStyles3;
//        timerView3.progressStyles.remainingStyle = pStyle;
        
//        [self addSubview:timerView];
//        [self addSubview:timerView2];
//        [self addSubview:timerView3];        
        //FCRaysView
//        FCRaysView *firstRays = [[FCRaysView alloc]initWithFrame:CGRectMake(0, 0, 768, 1024)];
        FCRaysView *rays1 = [[FCRaysView alloc]initWithFrame:CGRectMake(0, 0, 400, 1000)];
        [rays1 setClipsToBounds:NO];
        [self addSubview:rays1];
        [self sendSubviewToBack:rays1];
        
        FCRaysView *rays2 = [[FCRaysView alloc]initWithFrame:CGRectMake(400,0, 400, 400)];
        [rays2 setClipsToBounds:NO];
        [self addSubview:rays2];
        [self sendSubviewToBack:rays2];

        [self setBackgroundColor:[UIColor purpleColor]];
    }    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//not sure if this is the right place for statusLabel dealloc--> ASK
-(void)dealloc
{
    [super dealloc];        //will this interfere with the ViewController dealloc?
}

@end
