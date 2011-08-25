//
//  DrawView.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//This line should be updated only in the branch

#import "DrawView.h"
#import "ButtonBasic.h"
#import "ButtonCircular.h"
#import "ButtonInternalStyle.h"
#import "ButtonWithBackground.h"
#import "ButtonBezelled.h"
#import "DrawLabel.h"
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"
#import "FCGradientStyle.h"
#import "FCGraphicsAPI.h"
#import "UIViewGradient.h"

//Ahmed suggests using the UIScreen element to get info about the dimensions etc., but I don't see those properties in the UIScreen elt.

#define IPAD_MAX_WIDTH 768
#define IPAD_MAX_HEIGHT 1024
#define BUTTON_DEFAULT_HEIGHT 60
#define BUTTON_DEFAULT_WIDTH 200
#define BUTTON__Y_SPACING 20
#define BUTTON_X_SPACING 60
#define SHADOW_H_OFFSET 3
#define SHADOW_W_OFFSET 0
#define DARK_PINK 0xFF0099
#define MEDIUM_PINK 0xFF66FF


@implementation DrawView
@synthesize statusLabel;

- (void)buttonClicked:(id)sender
{
    NSLog(@"Button Clicked");
    [sender buttonClicked];
    [sender drawRect:[(ButtonBezelled *)sender frame]];
}

- (void)buttonPressed:(id)sender
{
    NSLog(@"ButtonPressed");
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *newText = [[NSString alloc] initWithFormat:
                         @"%@ button pressed.", title];
    statusLabel.text = newText;
    [newText release];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //theme FCShapeStyle
        FCShapeStyle *myStyle = [[FCShapeStyle alloc]init];
        myStyle.fillColor = [UIColor redColor];
        myStyle.strokeColor = [UIColor blueColor];
        myStyle.strokeWidth = [NSNumber numberWithFloat:5.5];
        
        NSString *defaultText = @"No Button Pressed";
        
        //Special extra style object for the FCGraphicsAPI drawRect Method
        FCRectangleStyle *rectangleStyle = [[FCRectangleStyle alloc] init];
        rectangleStyle.cornerRadius = [NSNumber numberWithInt:10];
        rectangleStyle.style = myStyle;
                
        //////BUTTONS
        //left
        

         
        ButtonBasic *left = [ButtonBasic buttonWithType:UIButtonTypeCustom];
        left.frame = CGRectMake(100, 500, 200, 60);
        left.buttonStyle = rectangleStyle; 
        [left setTitle:@"Left" forState:UIControlStateNormal];

//         This is the tricky bit!! Note target is DrawView, and that buttonPressed takes and arg, so you have to include the ':'
//         note also that because DrawButton inherits from UIButton it has the 'addtarget' method

        [left addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //right
        ButtonBasic *right = [ButtonBasic buttonWithType:UIButtonTypeCustom];
        right.frame = CGRectMake(400, 500, 200, 80);
        right.buttonStyle = rectangleStyle;
        [right setTitle:@"Right" forState:UIControlStateNormal];
        [right addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //status label (drawn like a button)
        CGRect labelRect = CGRectMake(200, 700, 300, 80);
        statusLabel = [[DrawLabel alloc]initWithFrame:labelRect];
        [statusLabel setBackgroundColor:[UIColor clearColor]];  //set the label's background to clear.
        statusLabel.labelStyle = rectangleStyle;
        
        statusLabel.textColor = [UIColor blueColor];
        statusLabel.textAlignment = UITextAlignmentCenter; //not sure about this syntax..
        statusLabel.font = [UIFont boldSystemFontOfSize:30];
        //statusLabel.minimumFontSize = 9; //allows the text to resize to fit if possible.
        statusLabel.text = defaultText;
        
        //////Add views
        [self addSubview:left];
        [self addSubview:right];
        [self addSubview:statusLabel];
        
        
        
        //////style experiments
        //'all' button style
        UIColor *expDarkPink = [FCGraphicsAPI UIColorFromRGB:DARK_PINK];
        UIColor *expMediumPink = [FCGraphicsAPI UIColorFromRGB:MEDIUM_PINK];
        UIColor *expFadedDarkPink = [FCGraphicsAPI UIColorFromRGB:0xCC3366];
        UIColor *expFadedMediumPink = [FCGraphicsAPI UIColorFromRGB:0xCC66CC];
        CGRect templateRect = CGRectMake(50, 50, 200, 60); //experiment to create a starting template button and define the rest relative to it

        FCShapeStyle *all_Style = [[FCShapeStyle alloc]init];
        all_Style.fillColor = expDarkPink; //see what this is, maybe implement text fields to adjust as exercise
        all_Style.strokeColor = expMediumPink;  //I'd prefer to mess with the alpha, and/or make it slightly darker
        all_Style.strokeWidth = [NSNumber numberWithInt:1]; //in points, and I want it to be barely there.
        
        FCGradientStyle *all_Gradient = [[FCGradientStyle alloc]init];
        all_Gradient.fillColor = expMediumPink;               //this is necessary for the shape to draw, period.
        all_Gradient.gradientColor = expDarkPink;             //optional, note that this is the bottom of the gradient if vertical
        all_Gradient.fillType = kFCGradientVertical;          //types will be ignored in the absence of a gradientColor
        all_Gradient.strokeColor = expDarkPink;
        all_Gradient.strokeGradientColor = expMediumPink;  
        all_Gradient.strokeType = kFCGradientVertical;      //presumably this won't be used?
        
        FCRectangleStyle *all_RectStyle = [[FCRectangleStyle alloc]init];
        all_RectStyle.cornerRadius = [NSNumber numberWithInt:10];
        all_RectStyle.style = all_Gradient;
        

        ButtonBasic *all1 = [ButtonBasic buttonWithType:UIButtonTypeCustom];
        all1.frame = CGRectMake(templateRect.origin.x, templateRect.origin.y, templateRect.size.width, templateRect.size.height);
        all1.buttonStyle = all_RectStyle;
        [all1 setTitle:@"All" forState:UIControlStateNormal];              //cheap! (and not that accurate..)
        [all1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        all1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [all1 setTitleEdgeInsets:UIEdgeInsetsMake(0, all1.frame.size.width/8, 0, 0)];
        all1.titleLabel.font = [UIFont boldSystemFontOfSize:templateRect.size.height/2.5]; //clearly not the same system.. should be resized internally?
        //note for future fun, there's a title LABEL field for buttons..
        [self addSubview:all1];
        
        
        //'my portfolio' button style
        FCGradientStyle *myP_Gradient = [[FCGradientStyle alloc]init];
        myP_Gradient.fillColor = expFadedMediumPink; 
        myP_Gradient.gradientColor = expFadedDarkPink;
        myP_Gradient.fillType = kFCGradientVertical;
        myP_Gradient.strokeColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        myP_Gradient.strokeGradientColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1]; //have to explicitly define alpha
        myP_Gradient.strokeType = kFCGradientRadial;
        myP_Gradient.strokeWidth = [NSNumber numberWithInt:2]; //with 100, it's visibly pushing in the edges..
        
        FCRectangleStyle *myP_RectStyle = [[FCRectangleStyle alloc]init];
        myP_RectStyle.cornerRadius = [NSNumber numberWithInt:10];
        myP_RectStyle.style = myP_Gradient;
        
        //background    //moved inside the DrawButton2 class
//        FCRectangleStyle *myP_RectStyleB = [[FCRectangleStyle alloc]init];
//        myP_RectStyleB.cornerRadius = [NSNumber numberWithInt:15];          //Note: The corner curve is slightly different because one is inset.
//        myP_RectStyleB.style = all_Style;
        
        //create the button spaced below the original
        ButtonWithBackground *myP = [ButtonWithBackground buttonWithType:UIButtonTypeCustom];
        myP.frame = CGRectMake(templateRect.origin.x, 
                                       templateRect.origin.y + templateRect.size.height + BUTTON__Y_SPACING, 
                                       templateRect.size.width + 100, templateRect.size.height);
//        myP.bkgdStyle = myP_RectStyleB;
        myP.bkgdStyle = all_Style;
        myP.insetAmt = [NSNumber numberWithFloat:5];
        myP.buttonStyle = myP_RectStyle;
        [myP setTitle:@"My Portfolio" forState:UIControlStateNormal];
        [myP setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        myP.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        myP.contentEdgeInsets = UIEdgeInsetsMake(0, myP.frame.size.width/8, 0, 0);
        myP.titleLabel.font = [UIFont boldSystemFontOfSize:myP.frame.size.height/2.5];

        [self addSubview:myP];
        
        
        //'Visit your MW Floor' Button Style
        FCGradientStyle *visit_Gradient = [[FCGradientStyle alloc] init];
        visit_Gradient.fillColor = expMediumPink;
        visit_Gradient.gradientColor = expDarkPink;
        visit_Gradient.fillType = kFCGradientVertical;
        visit_Gradient.strokeColor = [UIColor purpleColor];
        visit_Gradient.strokeGradientColor = visit_Gradient.strokeColor;
        visit_Gradient.strokeType = kFCGradientRadial;
        visit_Gradient.strokeWidth = [NSNumber numberWithInt:7];
        
        FCRectangleStyle *visit_RectStyle = [[FCRectangleStyle alloc]init];
        visit_RectStyle.cornerRadius = [NSNumber numberWithInt:10];
        visit_RectStyle.style = visit_Gradient;
        
        ButtonBasic *visit = [ButtonBasic buttonWithType:UIButtonTypeCustom];
        visit.buttonStyle = visit_RectStyle;
        visit.frame = CGRectMake(myP.frame.origin.x, myP.frame.origin.y + myP.frame.size.height + BUTTON__Y_SPACING, 
                                 templateRect.size.width + 200, templateRect.size.height + 10);
        [visit setTitle:@"Visit your" forState:UIControlStateNormal];
        [visit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        visit.titleLabel.shadowColor = expDarkPink;
        visit.titleLabel.shadowOffset = CGSizeMake(SHADOW_W_OFFSET, SHADOW_H_OFFSET);
        visit.titleLabel.font = [UIFont boldSystemFontOfSize:visit.frame.size.height/3];
        visit.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
        visit.contentEdgeInsets = UIEdgeInsetsMake(0, ([visit.buttonStyle.style.strokeWidth floatValue]*2), 0, 0);
        [self addSubview:visit];
        
        //'inspiration' Button Style
        //antiquated: the bezel colors are based off of the button's style fillColor now.. but I can leave the capability
//        FCShapeStyle *insp_BezelStyle = [[FCShapeStyle alloc] init];        //bezels require two colors, so I'm shoving them in a style obj
//        insp_BezelStyle.fillColor = [UIColor purpleColor];
//        insp_BezelStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0xFFCCFF];
        ButtonBezelled *insp = [ButtonBezelled buttonWithType:UIButtonTypeCustom];
        insp.buttonStyle = myP_RectStyle;
        insp.bezelAmt = 5;
//        insp.bezelStyle = insp_BezelStyle;
        insp.frame = CGRectMake(visit.frame.origin.x, visit.frame.origin.y + visit.frame.size.height + BUTTON__Y_SPACING, 
                                templateRect.size.width + 180, templateRect.size.height+30);
        [insp setTitle:@"Inspiration" forState:UIControlStateNormal];
        [insp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
//        UILabel *inspLabel = [[UILabel alloc]initWithFrame:insp.frame];
//        inspLabel.text = @"Inspiration";
//        inspLabel.textColor = [UIColor whiteColor];
//        inspLabel.font = [UIFont boldSystemFontOfSize:templateRect.size.height+30];
//        inspLabel.textAlignment = UITextAlignmentCenter;
//        inspLabel.shadowColor = expDarkPink;
//        inspLabel.shadowOffset = CGSizeMake(0, 3);
//        // This causes an error--the property cannot be set.
//        insp.titleLabel = inspLabel;
//        //however, internet research suggests it CAN be added with the [BUTTONNAME addSubview:LABELNAME] call.
//        [insp addSubview:inspLabel];  //looks like this doesn't work either...
        insp.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        insp.titleLabel.font = [UIFont boldSystemFontOfSize:templateRect.size.height]; //clearly not the same system.. should be resized internally?
        insp.titleLabel.shadowColor = expDarkPink;
        insp.titleLabel.shadowOffset = CGSizeMake(SHADOW_W_OFFSET, SHADOW_H_OFFSET);
//        
//        /////////////
//        
////        [insp addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
////        [insp addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:insp];

        //UI color object take color  components.. decrease the color comps by a proportion
        //programmatic darkening/lightening
        //color with image pattern
        //nice to have: gradient text label...
        
        //'Buy' Button Style
        //shape style contains two colors, can be used to hold the two bezel colors..
        FCShapeStyle *buy_BezelStyle = [[FCShapeStyle alloc] init];
        buy_BezelStyle.fillColor = [FCGraphicsAPI UIColorFromRGB:0x000033];
        buy_BezelStyle.strokeColor = [FCGraphicsAPI UIColorFromRGB:0x99FFFF];
        FCGradientStyle *buy_Gradient = [[FCGradientStyle alloc]init];
        buy_Gradient.fillColor = [FCGraphicsAPI UIColorFromRGB:0x66FFFF];
        buy_Gradient.gradientColor = [FCGraphicsAPI UIColorFromRGB:0x00CCFF];
        buy_Gradient.fillType = kFCGradientVertical;
        buy_Gradient.strokeWidth = [NSNumber numberWithInt:0];
        buy_Gradient.strokeColor = [UIColor redColor];
        buy_Gradient.strokeGradientColor = buy_Gradient.strokeColor;
        buy_Gradient.strokeType = kFCGradientRadial; 
        FCRectangleStyle *buy_RectStyle = [[FCRectangleStyle alloc] init];
        buy_RectStyle.cornerRadius = [NSNumber numberWithInt:3];
        buy_RectStyle.style = buy_Gradient;
        ButtonBezelled *buy = [ButtonBezelled buttonWithType:UIButtonTypeCustom];
        buy.buttonStyle = buy_RectStyle;
        buy.bezelAmt = 3;
        buy.bezelStyle = buy_BezelStyle;
        buy.frame = CGRectMake(templateRect.origin.x + all1.frame.size.width + BUTTON_X_SPACING, templateRect.origin.y, 
                               templateRect.size.width/3, templateRect.size.height/2);
        buy.titleLabel.font = [UIFont boldSystemFontOfSize:buy.frame.size.height/2];
        [buy setTitle:@"Buy" forState:UIControlStateNormal];
        [buy setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:buy];

//        //All2
        ButtonInternalStyle *all2 = [[ButtonInternalStyle alloc]init];
        all2.buttonStyle = all_RectStyle;
        all2.frame = CGRectMake(buy.frame.origin.x + buy.frame.size.width + BUTTON_X_SPACING, 
                                buy.frame.origin.y, templateRect.size.width, templateRect.size.height);
        //Note that the internal shape frame's origin is measured from the button's frame origin
        //it determines placement within the button as though the button's origin is 0,0.
        all2.internalShapeFrame = CGRectMake(all2.frame.size.width*6.5/8, all2.frame.size.height/4,
                                             all2.frame.size.width/8 , all2.frame.size.height/2);
        FCShapeStyle *all2_TriStyle = [[FCShapeStyle alloc]init];
        all2_TriStyle.fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        all2_TriStyle.strokeWidth = [NSNumber numberWithInt:1];
        all2_TriStyle.strokeColor = [UIColor redColor];
        all2.internalShapeStyle = all2_TriStyle;
        all2.titleLabel.textAlignment = UITextAlignmentLeft;
        all2.titleLabel.font = [UIFont boldSystemFontOfSize:all2.frame.size.height/2];
        all2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        all2.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [all2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [all2 setTitle:@"All2" forState:UIControlStateNormal];
        [self addSubview:all2];
        
        
//        //Circular X button Style
        ButtonCircular *xButton = [[ButtonCircular alloc]initWithFrame:
                                   CGRectMake(myP.frame.origin.x + myP.frame.size.width + BUTTON_X_SPACING, 
                                              myP.frame.origin.y,
                                              templateRect.size.height, templateRect.size.height)];
        //frame adjustment not perfect
//        ButtonCircular *xButton = [[ButtonCircular alloc]initWithFrame:CGRectMake(0,0,templateRect.size.height, templateRect.size.height)];
        FCGradientStyle *xButton_GradientStyle = [[FCGradientStyle alloc]init];
        xButton_GradientStyle.fillColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        xButton_GradientStyle.gradientColor = [FCGraphicsAPI UIColorFromRGB:0xCC0033];
        xButton_GradientStyle.fillType = kFCGradientVertical; //kFCGradientDirectional; //add offsets for the gradient? no, cheaper to rotate the view
        xButton_GradientStyle.strokeColor = xButton_GradientStyle.gradientColor;
        xButton_GradientStyle.strokeGradientColor = xButton_GradientStyle.strokeColor;
        xButton_GradientStyle.strokeWidth = [NSNumber numberWithInt:3];
        CGSize shadowOffset = CGSizeMake(-5, 5); //looks good, but negative values cause trouble--the shadow is clipped.
        xButton.shadowOffset = shadowOffset;
        /*
         Aha! You can't change the frame internally, (which is probably a good thing),
         but this means a drop shadow currently requires a resize of the frame so it doesn't clip
        */
        CGRect newFrame = CGRectMake(xButton.frame.origin.x + fmin(shadowOffset.width,0), 
                                     xButton.frame.origin.y + fmin(shadowOffset.height,0), 
                                     xButton.frame.size.width + fabs(shadowOffset.width), 
                                     xButton.frame.size.height + fabs(shadowOffset.height));
        xButton.frame = newFrame;
        NSLog(@"xbutton Frame changed to accomodate Shadow X:%f, Y:%f, W:%f, H:%f", xButton.frame.origin.x, xButton.frame.origin.y, xButton.frame.size.width, xButton.frame.size.height);
        
        xButton.titleLabel.textAlignment = UITextAlignmentCenter;
        xButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        xButton.buttonStyle = (FCShapeStyle *) xButton_GradientStyle;
        //rotate button 45 degrees before adding to view
        
//        [xButton setClipsToBounds:NO];    //doesn't seem to work, so I've written a math-y workaround
        [self addSubview:xButton];
        
        ////Textured Background Button
        FCShapeStyle *tButtonStyle = [[FCShapeStyle alloc]init];
        tButtonStyle.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pink-texture-1-7lg.jpg"]];
        tButtonStyle.strokeColor = [UIColor whiteColor];
        tButtonStyle.strokeWidth = [NSNumber numberWithInt:2];
        
        FCRectangleStyle *tRectStyle = [[FCRectangleStyle alloc]init];
        tRectStyle.cornerRadius = [NSNumber numberWithInt:10];
        tRectStyle.style = tButtonStyle;
        
        CGRect tRect = CGRectMake(xButton.frame.origin.x+xButton.frame.size.width, 
                                  xButton.frame.origin.y + xButton.frame.size.height + BUTTON__Y_SPACING,
                                  templateRect.size.width*4/3, templateRect.size.height);
        
        ButtonBasic *tButton = [[ButtonBasic alloc]initWithFrame:tRect];
        tButton.buttonStyle = tRectStyle;
        [tButton setTitle:@"Total Design Cred:" forState:UIControlStateNormal];
        [tButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        tButton.titleLabel.shadowColor = expDarkPink;
        tButton.titleLabel.shadowOffset = CGSizeMake(SHADOW_W_OFFSET, SHADOW_H_OFFSET);
        tButton.titleLabel.font = [UIFont boldSystemFontOfSize:tButton.frame.size.height/2.5];
        tButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        tButton.contentEdgeInsets = UIEdgeInsetsMake(0, [tButton.buttonStyle.style.strokeWidth floatValue] + 2, 0, 0);
        
        //missing second text section, with style formatting
        [self addSubview:tButton];
        
        [self setBackgroundColor:[UIColor greenColor]];
        
        
        ////LoadingScreen Background View Test
        /*
         Haven't done anything yet with the order of the view.. should it be behind everything else? etc.
         */
//        UIViewGradient *bkgdView = [[UIViewGradient alloc]initWithFrame:CGRectMake(0, 0, IPAD_MAX_WIDTH, IPAD_MAX_HEIGHT)];
//        FCGradientStyle *bkgdGradient = [[FCGradientStyle alloc]init];
//        bkgdGradient.fillColor = expFadedMediumPink;
//        bkgdGradient.gradientColor = expFadedDarkPink;
//        bkgdGradient.fillType = kFCGradientRadial;
//        bkgdGradient.strokeGradientColor = expFadedDarkPink;
//        bkgdGradient.strokeColor = expFadedDarkPink;
//        FCRectangleStyle *bkgdRect = [[FCRectangleStyle alloc]init];
//        bkgdRect.style = bkgdGradient;
//        bkgdView.viewStyle = bkgdRect;
//        
//        [self addSubview:bkgdView];

        
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
    [statusLabel release];
    [super dealloc];        //will this interfere with the ViewController dealloc?
}

@end
