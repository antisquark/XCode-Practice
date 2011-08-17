//
//  Button_FunViewController.h
//  Button Fun
//
//  Created by Isaac Greenbride on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Button_FunViewController : UIViewController {
    IBOutlet UILabel *statusText;
}
@property (retain, nonatomic) UILabel *statusText;

- (IBAction)buttonPressed:(id)sender;

@end
