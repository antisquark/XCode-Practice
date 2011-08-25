//
//  View_PracticeAppDelegate.h
//  View Practice
//
//  Created by Isaac Greenbride on 8/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class View_PracticeViewController;

@interface View_PracticeAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet View_PracticeViewController *viewController;

@end
