//
//  FCRectangleStyle.h
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class FCShapeStyle;
@class FCComplexCorner;

@interface FCRectangleStyle : NSObject 
{
    
}

@property (nonatomic, retain) FCShapeStyle *style;
@property (nonatomic, retain) NSNumber *cornerRadius;
@property (nonatomic, retain) FCComplexCorner *complexCorner;

@end
