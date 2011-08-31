//
//  FCStorePhotosZeroResultsBg.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCRectangleStyle.h"
#import "FCShapeStyle.h"

@interface FCStorePhotosZeroResultsBg : UIView
{
    
}
@property (retain, nonatomic) FCRectangleStyle *viewRectStyle; 
@property (retain, nonatomic) FCShapeStyle *viewDrawStyle; 
@property (retain, nonatomic) FCShapeStyle *shadowStyle;
- (id) initWithSize:(CGSize)myOrigin;
@end
