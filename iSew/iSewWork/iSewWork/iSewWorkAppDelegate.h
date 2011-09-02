//
//  iSewWorkAppDelegate.h
//  iSewWork
//
//  Created by Isaac Greenbride on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iSewWorkViewController;

@interface iSewWorkAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet iSewWorkViewController *viewController;

@end
