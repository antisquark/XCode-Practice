//
//  FCRaysView.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FCRaysView.h"
#import "FCGraphicsAPI.h"
#import "FCGradientStyle.h"

@implementation FCRaysView
@synthesize style1;
@synthesize style2;

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //init the background to a gray gradient fading to transparent at the edges
//        style1 = [[FCGradientStyle alloc]init];
//        style1.fillColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:0];
//        style1.gradientColor = [UIColor grayColor];
//        style1.fillType = kFCGradientRadial;
//        style1.strokeColor = [UIColor redColor];
//        style1.strokeGradientColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5];
    }
    return self;
}
- (id)initWithFrame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    if (self) {
        // Custom initialization
        //init the background to a gray gradient fading to transparent at the edges
        style1 = [[FCGradientStyle alloc]init];
        style1.fillColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:1];
        style1.gradientColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:0.0];
        style1.fillType = kFCGradientRadialFirstHalf;
        style1.strokeColor = [UIColor redColor];
        style1.strokeGradientColor = [UIColor colorWithRed:.5 green:.5 blue:.5 alpha:.5];
        [self setOpaque:NO];
    }
    return self;
}

//- (void)didReceiveMemoryWarning
//{
//    // Releases the view if it doesn't have a superview.
//    [super didReceiveMemoryWarning];
//    
//    // Release any cached data, images, etc that aren't in use.
//}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

//- (void)viewDidUnload
//{
//    [super viewDidUnload];
//    // Release any retained subviews of the main view.
//    // e.g. self.myOutlet = nil;
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void) drawRect:(CGRect)rect
{
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //now with refactored drawEllipseSliceStart, this should be WAY easier.
    //create a rectangle that's bigger than the rect on all sides
    //this gives an empty path... because it's clipping? ..instead draw the radius outside of the rect
//    CGRect rectangle = CGRectMake(-rect.size.width*2, -rect.size.height*2, rect.size.width*4, rect.size.height*4);
    //set the standard arc length
    float arcLength = 2*M_PI/SUBDIVISIONS;
    //loop through the arcs you want to draw
    for(float currentArc = 0; currentArc<SUBDIVISIONS; currentArc=currentArc+2)
    {
        //if you want the rays to extend to the borders of the rectangle, use rect.size.width or height for the withRadius value
//        [FCGraphicsAPI drawEllipseSliceStartRadius:rect withStyle:style1 withRadius:rect.size.height arcAngleStart:3*M_PI_2+currentArc*arcLength arcAngleLength:arcLength context:currentContext];
        [FCGraphicsAPI drawEllipseSliceStart:rect withStyle:style1 arcAngleStart:3*M_PI_2+currentArc*arcLength arcAngleLength:arcLength context:currentContext];
    }
    //support for beachball pattern, if you don't want to simply set a background color.
    if(nil != style2)
    {
        for(float currentArc = 1; currentArc<SUBDIVISIONS; currentArc=currentArc+2)
        {
        [FCGraphicsAPI drawEllipseSliceStart:rect withStyle:style2 arcAngleStart:3*M_PI_2+currentArc*arcLength arcAngleLength:arcLength context:currentContext];
        }
    }
    


//    NSLog(@"current arcLength: %f", arcLength);
    [style1 release];
}
    
- (void) dealloc
{
    [super dealloc];
}

@end
