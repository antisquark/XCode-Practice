//
//  View_PracticeViewController.m
//  View Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "View_PracticeViewController.h"
#import "DrawView.h"
#import "DrawView2.h"
#define IPAD_MAX_WIDTH 768
#define IPAD_MAX_HEIGHT 1024

@implementation View_PracticeViewController

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
    DrawView *dView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, IPAD_MAX_WIDTH, IPAD_MAX_HEIGHT)];
    [self.view addSubview:dView];
}


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

@end
