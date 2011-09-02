//
//  iSew2AppDelegate.h
//  iSew2
//
//  Created by Isaac Greenbride on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iSew2ViewController;

@interface iSew2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet iSew2ViewController *viewController;

@end
