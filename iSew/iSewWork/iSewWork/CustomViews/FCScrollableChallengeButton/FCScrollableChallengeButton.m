//
//  FCScrollableChallengeButton.m
//  iSewWork
//
//  Created by Isaac Greenbride on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
/*
 Rounded corner rectangle (with a slightly shorter rounded rect acting as a dark gradient? ending an extra stroke width from the bottom)
 Image loaded over a white square with sharp corners and a dark brown border
 
 A bar at the bottom with up to 4 inscribed stars spaced evenly.
 */
#import "FCScrollableChallengeButton.h"
//#import "FCShapeStyle.h"
//#import "FCRectangleStyle.h"
#import "FCGraphicsAPI.h"
#import "iSewLevelScrollableStyle.h"

@implementation FCScrollableChallengeButton
//@synthesize starStyle;
//@synthesize starBarRStyle;
//@synthesize buttonRStyle;
//@synthesize imageBoxRStyle;
@synthesize myImage;
@synthesize LOCKED;
@synthesize stars;

@synthesize levelStyle;


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        [self setOpaque:NO];
        stars = 0;
        
//        starBarRStyle = [[FCRectangleStyle alloc] init];
//        buttonRStyle = [[FCRectangleStyle alloc] init];
//        imageBoxRStyle = [[FCRectangleStyle alloc] init];
//        starStyle = [[FCShapeStyle alloc] init];
//        
//        starStyle.fillColor = [UIColor whiteColor];
//        starStyle.strokeColor = [UIColor brownColor];
//        starStyle.strokeWidth = [NSNumber numberWithInt:1];
//        
//        FCShapeStyle *starBarStyle = [[FCShapeStyle alloc]init];
//        starBarStyle.fillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
//        
//        starBarRStyle.style = starBarStyle;
//        starBarRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        
//        FCShapeStyle *buttonStyle = [[FCShapeStyle alloc]init];
//        buttonStyle.fillColor = [UIColor whiteColor];
//        buttonStyle.strokeColor = [UIColor redColor];
//        buttonStyle.strokeWidth = [NSNumber numberWithInt: 5]; 
//        
//        buttonRStyle.style = buttonStyle;
//        buttonRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        FCShapeStyle *imageBoxStyle = [[FCShapeStyle alloc]init];
//        imageBoxStyle.fillColor = [UIColor whiteColor];
//        imageBoxStyle.strokeColor = [UIColor brownColor];
//        imageBoxStyle.strokeWidth = [NSNumber numberWithInt:1];
        
//        imageBoxRStyle.style = imageBoxStyle;
        levelStyle = [[iSewLevelScrollableStyle alloc]init];
        levelStyle.outerBoxFillColor = [UIColor redColor];
        levelStyle.imageBoxFillColor = [UIColor whiteColor];
        levelStyle.starBarFillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
        levelStyle.starFillColor = [UIColor whiteColor];
//        levelStyle.outerBoxStrokeColor = [UIColor clearColor];
        levelStyle.imageBoxStrokeColor = [UIColor brownColor];
        levelStyle.starStrokeColor = [UIColor brownColor];
        levelStyle.cornerRadius = [NSNumber numberWithInt: DEFAULT_CORNER_RADIUS];
//        levelStyle.outerBoxstrokeWidth = [NSNumber numberWithInt:0];
        levelStyle.imageBoxStrokeWidth = [NSNumber numberWithInt:1];
        levelStyle.starStrokeWidth = [NSNumber numberWithInt:1];
        
        myImage = nil;
        LOCKED = FALSE;
    }
    return self;
}

//- (id)initWithFrameImage:(CGRect)frame imageName:(NSString *)imageName
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setOpaque:NO];
//        // Initialization code here.
//        starBarRStyle = [[FCRectangleStyle alloc] init];
//        buttonRStyle = [[FCRectangleStyle alloc] init];
//        imageBoxRStyle = [[FCRectangleStyle alloc] init];
//        starStyle = [[FCShapeStyle alloc] init];
//        
//        starStyle.fillColor = [UIColor whiteColor];
//        starStyle.strokeColor = [UIColor brownColor];
//        starStyle.strokeWidth = [NSNumber numberWithInt:1];
//        
//        FCShapeStyle *starBarStyle = [[FCShapeStyle alloc]init];
//        starBarStyle.fillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
//        
//        starBarRStyle.style = starBarStyle;
//        starBarRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        
//        FCShapeStyle *buttonStyle = [[FCShapeStyle alloc]init];
//        buttonStyle.fillColor = [UIColor redColor];//whiteColor];
//        //        buttonStyle.strokeColor = [UIColor redColor];
//        //        buttonStyle.strokeWidth = [NSNumber numberWithInt: 5]; 
//        
//        buttonRStyle.style = buttonStyle;
//        buttonRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        FCShapeStyle *imageBoxStyle = [[FCShapeStyle alloc]init];
//        //optionally we can just load the image in, but this doesn't guarantee white background, etc.
//        if(imageName != nil)
//        {
//            imageBoxStyle.fillColor = [UIColor colorWithPatternImage:[UIImage imageNamed:myImage]];  
//        } 
//        else 
//        {
//            imageBoxStyle.fillColor =[UIColor whiteColor];
//        }
//            imageBoxStyle.strokeColor = [UIColor brownColor];
//        imageBoxStyle.strokeWidth = [NSNumber numberWithInt:1];
//        
//        imageBoxRStyle.style = imageBoxStyle;
//        imageBoxRStyle.cornerRadius = [NSNumber numberWithInt:0];
//    }
//    return self;
//}
- (id)initWithImage:(NSString *)imageName
{
    self = [super init];
    if (self) {
        // Initialization code here.
        
        [self setOpaque:NO];
        stars = 0;
        
//        starBarRStyle = [[FCRectangleStyle alloc] init];
//        buttonRStyle = [[FCRectangleStyle alloc] init];
//        imageBoxRStyle = [[FCRectangleStyle alloc] init];
//        starStyle = [[FCShapeStyle alloc] init];
//        
//        starStyle.fillColor = [UIColor whiteColor];
//        starStyle.strokeColor = [UIColor brownColor];
//        starStyle.strokeWidth = [NSNumber numberWithInt:2];
//        
//        FCShapeStyle *starBarStyle = [[FCShapeStyle alloc]init];
//        starBarStyle.fillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
//        
//        starBarRStyle.style = starBarStyle;
//        starBarRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        
//        FCShapeStyle *buttonStyle = [[FCShapeStyle alloc]init];
//        buttonStyle.fillColor = [UIColor whiteColor];
//        buttonStyle.strokeColor = [UIColor redColor];
//        buttonStyle.strokeWidth = [NSNumber numberWithInt: 5]; 
//        
//        buttonRStyle.style = buttonStyle;
//        buttonRStyle.cornerRadius = [NSNumber numberWithInt:DEFAULT_CORNER_RADIUS];
//        
//        FCShapeStyle *imageBoxStyle = [[FCShapeStyle alloc]init];
//        imageBoxStyle.fillColor = [UIColor whiteColor];
//        imageBoxStyle.strokeColor = [UIColor brownColor];
//        imageBoxStyle.strokeWidth = [NSNumber numberWithInt:1];
//        
//        imageBoxRStyle.style = imageBoxStyle;
        
        myImage = nil;
        LOCKED = FALSE;
        levelStyle = [[iSewLevelScrollableStyle alloc]init];
        levelStyle.outerBoxFillColor = [UIColor redColor];
        levelStyle.imageBoxFillColor = [UIColor whiteColor];
        levelStyle.starBarFillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
        levelStyle.starFillColor = [UIColor whiteColor];
        //        levelStyle.outerBoxStrokeColor = [UIColor clearColor];
        levelStyle.imageBoxStrokeColor = [UIColor brownColor];
        levelStyle.starStrokeColor = [UIColor brownColor];
        levelStyle.cornerRadius = [NSNumber numberWithInt: DEFAULT_CORNER_RADIUS];
        //        levelStyle.outerBoxstrokeWidth = [NSNumber numberWithInt:0];
        levelStyle.imageBoxStrokeWidth = [NSNumber numberWithInt:1];
        levelStyle.starStrokeWidth = [NSNumber numberWithInt:1];
        
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    stars = MIN(stars, STARS_MAX);  //error checking on the number of stars
    CGContextRef currentContext = UIGraphicsGetCurrentContext();

    /*
     Old Version using a bunch of stored styles.
     */
//    ////Draw the Textured Border for the button's Image Icon
//    CGRect topRect = CGRectMake(0, 0, 
//                                rect.size.width, 
//                                (rect.size.height*(STARBAR_FRACTION_OF_HEIGHT-1)/STARBAR_FRACTION_OF_HEIGHT)-VERTICAL_BAR_SPACER);
//    [FCGraphicsAPI drawRect:topRect withStyle:buttonRStyle context:currentContext];
//    
//    ////Draw the inner background box for the Button's Image Icon
//    CGRect imageRect = CGRectMake(topRect.origin.x+IMAGE_BORDER_SPACER, topRect.origin.y + IMAGE_BORDER_SPACER, 
//                                  topRect.size.width-2*IMAGE_BORDER_SPACER, topRect.size.height-2*IMAGE_BORDER_SPACER);
//    [FCGraphicsAPI drawRect:imageRect withStyle:imageBoxRStyle context:currentContext];
//    
//    ////Draw the Button's Image Icon
//    if(nil != myImage){
//        UIImage *imageIcon = [UIImage imageNamed:myImage];
//        //        imageRect = CGRectMake(topRect.origin.x+IMAGE_BORDER_SPACER+[imageBoxRStyle.style.strokeWidth floatValue], 
//        //                               topRect.origin.y + IMAGE_BORDER_SPACER+[imageBoxRStyle.style.strokeWidth floatValue], 
//        //                               topRect.size.width-2*IMAGE_BORDER_SPACER-2*[imageBoxRStyle.style.strokeWidth floatValue], 
//        //                               topRect.size.height-2*IMAGE_BORDER_SPACER-2*[imageBoxRStyle.style.strokeWidth floatValue]);
//        //construct a new rect using the image's dimensions, centered in the image rectangle
//        CGRect imageRect2 = CGRectMake(imageRect.origin.x+[imageBoxRStyle.style.strokeWidth floatValue]+(imageRect.size.width-imageIcon.size.width)/2, 
//                                       imageRect.origin.y+[imageBoxRStyle.style.strokeWidth floatValue]+(imageRect.size.height-imageIcon.size.height)/2, 
//                                       imageIcon.size.width, imageIcon.size.height);
//        CGContextSaveGState(currentContext);
//        [imageIcon drawInRect:imageRect2];
//        CGContextRestoreGState(currentContext);        
//    }
//    
//    ////Draw the Lock image if the image is locked
//    if(LOCKED){
//        UIImage *imageIcon = [UIImage imageNamed:@"buttonLockTest.png"];
//        //construct a new rect using the image's dimensions, centered in the image rectangle
//        CGRect imageRect2 = CGRectMake(imageRect.origin.x+[imageBoxRStyle.style.strokeWidth floatValue]+(imageRect.size.width-imageIcon.size.width)/2, 
//                                       imageRect.origin.y+[imageBoxRStyle.style.strokeWidth floatValue]+(imageRect.size.height-imageIcon.size.height)/2, 
//                                       imageIcon.size.width, imageIcon.size.height);
//        CGContextSaveGState(currentContext);
//        [imageIcon drawInRect:imageRect2];
//        CGContextRestoreGState(currentContext);        
//    }
//    
//    ////Draw the Stars
//    CGRect starBarRect = CGRectMake(0,topRect.size.height+VERTICAL_BAR_SPACER,
//                                    rect.size.width, 
//                                    rect.size.height/STARBAR_FRACTION_OF_HEIGHT);
//    [FCGraphicsAPI drawRect:starBarRect withStyle:starBarRStyle context:currentContext];
//    
//    
//    //define the size and position of the first star
//    float starHeight = starBarRect.size.height*9/10;    //Arbitrary proportion, but looks good
//    float starHSpacer = (starBarRect.size.width - STARS_MAX*starHeight)/STARS_MAX;
//    float starVSpacer = (starBarRect.size.height-starHeight)/2;
//    CGRect starRect;
//    for(int i = 0; i<stars; i++)
//    {
//        starRect = CGRectMake(starBarRect.origin.x + starHSpacer/2 +i*(starHeight + starHSpacer), 
//                              starBarRect.origin.y +starVSpacer, 
//                              starHeight, starHeight);
//        [FCGraphicsAPI drawStar:starRect withStyle:starStyle orientation:kFCTriangleUp context:currentContext];
//    }
    
    //    levelStyle = [[iSewLevelScrollableStyle alloc]init];
    //    levelStyle.outerBoxFillColor = [UIColor redColor];
    //    levelStyle.imageBoxFillColor = [UIColor whiteColor];
    //    levelStyle.starBarFillColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:.5];
    //    levelStyle.starFillColor = [UIColor whiteColor];
    //    levelStyle.imageBoxStrokeColor = [UIColor brownColor];
    //    levelStyle.starStrokeColor = [UIColor brownColor];
    //    levelStyle.cornerRadius = [NSNumber numberWithInt: DEFAULT_CORNER_RADIUS];
    FCRectangleStyle *drawRectStyle = [[FCRectangleStyle alloc]init];
    FCShapeStyle *drawShapeStyle = [[FCShapeStyle alloc]init];
    drawRectStyle.style = drawShapeStyle;
    drawRectStyle.cornerRadius = levelStyle.cornerRadius;
    
    ////Draw the Textured Border for the button's Image Icon
    CGRect topRect = CGRectMake(0, 0, 
                                rect.size.width, 
                                (rect.size.height*(STARBAR_FRACTION_OF_HEIGHT-1)/STARBAR_FRACTION_OF_HEIGHT)-VERTICAL_BAR_SPACER);
    //set style values for outer box
    drawShapeStyle.fillColor = levelStyle.outerBoxFillColor;
    drawShapeStyle.strokeColor = [UIColor clearColor];
    [FCGraphicsAPI drawRect:topRect withStyle:drawRectStyle context:currentContext];
    
    ////Draw the inner background box for the Button's Image Icon
    CGRect imageRect = CGRectMake(topRect.origin.x+IMAGE_BORDER_SPACER, topRect.origin.y + IMAGE_BORDER_SPACER, 
                                  topRect.size.width-2*IMAGE_BORDER_SPACER, topRect.size.height-2*IMAGE_BORDER_SPACER);
    //set style values for image box
    drawShapeStyle.fillColor = levelStyle.imageBoxFillColor;
    drawShapeStyle.strokeColor = levelStyle.imageBoxStrokeColor;
    drawShapeStyle.strokeWidth = levelStyle.imageBoxStrokeWidth;
    [FCGraphicsAPI drawRect:imageRect withStyle:drawRectStyle context:currentContext];
    
    ////Draw the Button's Image Icon
    if(nil != myImage){
        UIImage *imageIcon = [UIImage imageNamed:myImage];
        //construct a new rect using the image's dimensions, centered in the image rectangle
        CGRect imageRect2 = CGRectMake(imageRect.origin.x+[levelStyle.imageBoxStrokeWidth floatValue]+(imageRect.size.width-imageIcon.size.width)/2, 
                                       imageRect.origin.y+[levelStyle.imageBoxStrokeWidth floatValue]+(imageRect.size.height-imageIcon.size.height)/2, 
                                       imageIcon.size.width, imageIcon.size.height);
        CGContextSaveGState(currentContext);
        [imageIcon drawInRect:imageRect2];
        CGContextRestoreGState(currentContext);        
    }
    
    ////Draw the Lock image if the image is locked
    if(LOCKED){
        UIImage *imageIcon = [UIImage imageNamed:@"buttonLockTest.png"];
        //construct a new rect using the image's dimensions, centered in the image rectangle
        CGRect imageRect2 = CGRectMake(imageRect.origin.x+[levelStyle.imageBoxStrokeWidth floatValue]+(imageRect.size.width-imageIcon.size.width)/2, 
                                       imageRect.origin.y+[levelStyle.imageBoxStrokeWidth floatValue]+(imageRect.size.height-imageIcon.size.height)/2, 
                                       imageIcon.size.width, imageIcon.size.height);
        CGContextSaveGState(currentContext);
        [imageIcon drawInRect:imageRect2];
        CGContextRestoreGState(currentContext);        
    }
    
    ////Draw the Star Bar
    CGRect starBarRect = CGRectMake(0,topRect.size.height+VERTICAL_BAR_SPACER,
                                    rect.size.width, 
                                    rect.size.height/STARBAR_FRACTION_OF_HEIGHT);
    drawShapeStyle.fillColor = levelStyle.starBarFillColor;
    drawShapeStyle.strokeWidth = [NSNumber numberWithInt:0]; //no stroke;
    [FCGraphicsAPI drawRect:starBarRect withStyle:drawRectStyle context:currentContext];
    
    
    ////Draw the Stars
    drawShapeStyle.fillColor = levelStyle.starFillColor;
    drawShapeStyle.strokeColor = levelStyle.starStrokeColor;
    drawShapeStyle.strokeWidth = levelStyle.starStrokeWidth;
    //define the size and position of the first star
//    float starHeight = starBarRect.size.height*9/10;    //Arbitrary proportion, but looks good
    //the starbar width imposes a ceiling on star size
    float starHeight = MIN(starBarRect.size.height*9/10, starBarRect.size.width/(STARS_MAX* 1.02));    
    float starHSpacer = (starBarRect.size.width - STARS_MAX*starHeight)/STARS_MAX;
    float starVSpacer = (starBarRect.size.height-starHeight)/2;
    CGRect starRect;
    for(int i = 0; i<stars; i++)
    {
        starRect = CGRectMake(starBarRect.origin.x + starHSpacer/2 +i*(starHeight + starHSpacer), 
                              starBarRect.origin.y +starVSpacer, 
                              starHeight, starHeight);
        [FCGraphicsAPI drawStar:starRect withStyle:drawShapeStyle orientation:kFCTriangleUp context:currentContext];
    }
    
    [drawShapeStyle release];
    [drawRectStyle release];
}

- (void) dealloc
{
//    [starStyle release];
//    [starBarRStyle release];
//    [buttonRStyle release];
//    [imageBoxRStyle release];
    [myImage release];
    [levelStyle release];
    [super dealloc];
}
@end
