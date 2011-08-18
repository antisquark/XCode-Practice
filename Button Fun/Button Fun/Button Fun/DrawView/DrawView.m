//
//  DrawView.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawView.h"
#import "DrawButton.h"
#import "FCShapeStyle.h"
#import "FCRectangleStyle.h"

@implementation DrawView

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
        //this is the tricky bit!! Note target is DrawView, and that buttonPressed takes and arg, so you have to include the ':'
        [left addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //right
        DrawButton *right = [DrawButton buttonWithType:UIButtonTypeCustom];
        right.frame = CGRectMake(400, 500, 200, 80);
        right.buttonStyle = rectangleStyle;
        [right setTitle:@"Right" forState:UIControlStateNormal];
        /* 
         The tricky bit again, note also that because DrawButton inherits from UIButton it has the 'addtarget' method
         */
        [right addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect labelRect = CGRectMake(200, 700, 300, 80);
        statusLabel = [[UILabel alloc]initWithFrame:labelRect];
        statusLabel.textColor = [UIColor redColor];
        statusLabel.textAlignment = UITextAlignmentCenter; //not sure about this syntax..
        statusLabel.font = [UIFont boldSystemFontOfSize:30];
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

@end
