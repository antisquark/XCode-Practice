//
//  FCScrollableChallengeButton.h
//  iSewWork
//
//  Created by Isaac Greenbride on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"
#import "iSewLevelScrollableStyle.h"
#define DEFAULT_CORNER_RADIUS 5
#define VERTICAL_BAR_SPACER ((rect.size.height/STARBAR_FRACTION_OF_HEIGHT)/2)
#define IMAGE_BORDER_SPACER 5
#define STARBAR_FRACTION_OF_HEIGHT 5
#define STARS_MAX 4

@interface FCScrollableChallengeButton : UIButton
{
    
//    FCShapeStyle *starStyle;
//    FCRectangleStyle *starBarRStyle;
//    FCRectangleStyle *buttonRStyle;
//    FCRectangleStyle *imageBoxRStyle;
    
    iSewLevelScrollableStyle *levelStyle;
    NSString *myImage;
    BOOL LOCKED;
    int stars;
}

//@property (retain, nonatomic) FCShapeStyle *starStyle;
//@property (retain, nonatomic) FCRectangleStyle *starBarRStyle;
//@property (retain, nonatomic) FCRectangleStyle *buttonRStyle;
//@property (retain, nonatomic) FCRectangleStyle *imageBoxRStyle;
@property (retain, nonatomic) iSewLevelScrollableStyle *levelStyle;
@property (retain, nonatomic) NSString *myImage;
@property (assign)  int stars;
@property (assign) BOOL LOCKED;


@end
