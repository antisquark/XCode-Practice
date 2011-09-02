//
//  iSewLevelScrollableStyle.h
//  iSewWork
//
//  Created by Isaac Greenbride on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface iSewLevelScrollableStyle : NSObject
{
    UIColor *outerBoxFillColor;
    UIColor *imageBoxFillColor;
    UIColor *starBarFillColor;
    UIColor *starFillColor;
    UIColor *outerBoxStrokeColor;
    UIColor *imageBoxStrokeColor;
    UIColor *starStrokeColor;
    NSNumber *imageBoxStrokeWidth;
    NSNumber *starStrokeWidth;
    NSNumber *cornerRadius;
}
@property (retain, nonatomic) UIColor *outerBoxFillColor;
@property (retain, nonatomic) UIColor *imageBoxFillColor;
@property (retain, nonatomic) UIColor *starBarFillColor;
@property (retain, nonatomic) UIColor *starFillColor;
@property (retain, nonatomic) UIColor *outerBoxStrokeColor;
@property (retain, nonatomic) UIColor *imageBoxStrokeColor;
@property (retain, nonatomic) UIColor *starStrokeColor;
@property (retain, nonatomic) NSNumber *outerBoxStrokeWidth;
@property (retain, nonatomic) NSNumber *imageBoxStrokeWidth;
@property (retain, nonatomic) NSNumber *starStrokeWidth;
@property (retain, nonatomic) NSNumber *cornerRadius;
@end
