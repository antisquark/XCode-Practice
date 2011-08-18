//
//  Button_FunViewController.m
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Button_FunViewController.h"
#import "DrawView.h"

@implementation Button_FunViewController

@synthesize statusLabel;




- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    DrawView *bView = [[DrawView alloc] initWithFrame:CGRectMake(0,0,768,1024)];   
    [self.view addSubview:bView];
}



//ISAAC: I'm assuming this replaces the definition of -(void)dealloc referred to on 38 of beginning Iphone development
//ISAAC: WRONG you must add a dealloc method.
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc
{
    [statusLabel release];
    [super dealloc];
}

@end
