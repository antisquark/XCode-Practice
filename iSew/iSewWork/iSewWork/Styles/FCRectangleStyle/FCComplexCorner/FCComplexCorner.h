//
//  FCComplexCorner.h
//  FCGraphicsTestApp
//
//  Created by Juan Gabriel Liévano on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum
{
    kFCCornerSchemeAll,
    kFCCornerSchemeUpper,
    kFCCornerSchemeLower,
    kFCCornerSchemeLeft,
    kFCCornerSchemeRight
} 
FCCornerScheme;

//  Each BOOL indicates whether a rectangle corner should be drawn round or not.
@interface FCComplexCorner : NSObject 
{
    
}

@property (nonatomic, assign) BOOL upperLeft, upperRight;
@property (nonatomic, assign) BOOL lowerLeft, lowerRight;

+ (id)complexCornerWithScheme:(FCCornerScheme)cornerScheme;
- (id)initWithScheme:(FCCornerScheme)cornerScheme;

@end
