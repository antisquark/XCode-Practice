//
//  DrawView.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

//This line should be updated only in the branch

#import "DrawView.h"
#import "DrawButton.h"
#import "DrawLabel.h"
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"

//Ahmed suggests using the UIScreen element to get info about the dimensions etc.
#define IPAD_MAX_WIDTH = 768;
#define IPAD_MAX_HEIGHT = 1024;

@implementation DrawView
@synthesize statusLabel;

- (void)buttonPressed:(id)sender
{
    NSLog(@"ButtonPressed");
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *newText = [[NSString alloc] initWithFormat:
                         @"%@ button pressed.", title];
    statusLabel.text = newText;
    [newText release];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //theme FCShapeStyle
        FCShapeStyle *myStyle = [[FCShapeStyle alloc]init];
        myStyle.fillColor = [UIColor redColor];
        myStyle.strokeColor = [UIColor blueColor];
        myStyle.strokeWidth = [NSNumber numberWithFloat:5.5];
        
        NSString *defaultText = @"No Button Pressed";
        
        //Special extra style object for the FCGraphicsAPI drawRect Method
        FCRectangleStyle *rectangleStyle = [[FCRectangleStyle alloc] init];
        rectangleStyle.cornerRadius = [NSNumber numberWithInt:10];
        rectangleStyle.style = myStyle;
        
        //left
        DrawButton *left = [DrawButton buttonWithType:UIButtonTypeCustom];
        left.frame = CGRectMake(100, 500, 200, 60);
        left.buttonStyle = rectangleStyle; 
        [left setTitle:@"Left" forState:UIControlStateNormal];
        /* 
         This is the tricky bit!! Note target is DrawView, and that buttonPressed takes and arg, so you have to include the ':'
         note also that because DrawButton inherits from UIButton it has the 'addtarget' method
        */
        [left addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        //right
        DrawButton *right = [DrawButton buttonWithType:UIButtonTypeCustom];
        right.frame = CGRectMake(400, 500, 200, 80);
        right.buttonStyle = rectangleStyle;
        [right setTitle:@"Right" forState:UIControlStateNormal];
        [right addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect labelRect = CGRectMake(200, 700, 300, 80);
        //statusLabel = [[UILabel alloc]initWithFrame:labelRect];
        statusLabel = [[DrawLabel alloc]initWithFrame:labelRect];
        [statusLabel setBackgroundColor:[UIColor clearColor]];  //set the label's background to clear.
        //self.backgroundColor = [UIColor blueColor]; //is the background clear?
        statusLabel.labelStyle = rectangleStyle;
        
        statusLabel.textColor = [UIColor blueColor];
        statusLabel.textAlignment = UITextAlignmentCenter; //not sure about this syntax..
        statusLabel.font = [UIFont boldSystemFontOfSize:30];
        //statusLabel.minimumFontSize = 9; //allows the text to resize to fit if possible.
        statusLabel.text = defaultText;
        [self addSubview:left];
        [self addSubview:right];
        [self addSubview:statusLabel];
        
    }    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

//not sure if this is the right place for statusLabel dealloc--> ASK
-(void)dealloc
{
    [statusLabel release];
    [super dealloc];        //will this interfere with the ViewController dealloc?
}

@end
