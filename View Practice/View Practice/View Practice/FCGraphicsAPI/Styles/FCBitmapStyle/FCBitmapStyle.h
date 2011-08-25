//
//  FCBitmapStyle.h
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//  This class is deprecated, [UIColor colorWithPatternImage:(UIImage *)image]
//  should be used instead.

#import <Foundation/Foundation.h>
#import "FCShapeStyle.h"


@interface FCBitmapStyle : FCShapeStyle 
{
    
}

@property (nonatomic, copy) NSString *imageURL;

@end
