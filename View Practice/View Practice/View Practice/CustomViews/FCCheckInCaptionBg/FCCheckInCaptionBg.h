//
//  checkInCaption_bkgd.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"

@interface FCCheckInCaptionBg : UIView
{
    
}
@property (retain, nonatomic) FCRectangleStyle *viewRectStyle;//should this just be internal to the draw method?
- (id) initWithSize:(CGSize)myOrigin;
@end
