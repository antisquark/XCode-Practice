//
//  FCFancyCircularProgressIndicator.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "FCCircularProgressIndicator.h"
#import "FCShapeStyle.h"
#define OFFSET_FRACTION 10


@interface FCFancyCircularProgressIndicator : FCCircularProgressIndicator
{
    FCShapeStyle *textStyle;
}
@property (retain, nonatomic) FCShapeStyle *textStyle;
- (id)init;
- (id)initWithSeconds:(float)seconds;
@end
