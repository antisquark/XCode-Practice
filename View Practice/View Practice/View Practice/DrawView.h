//
//  DrawView.h
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawLabel.h"

@interface DrawView : UIView {
    //UILabel *statusLabel;
    DrawLabel *statusLabel;

}
- (void)buttonPressed:(id)sender;

@property (retain, nonatomic) UILabel *statusLabel; // this should be under DrawView.h

@end
