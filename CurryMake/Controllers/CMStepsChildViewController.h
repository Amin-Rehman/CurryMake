//
//  CMStepsChildViewController.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMStepsChildViewController : UIViewController
@property (assign, nonatomic) NSInteger index;
@property (nonatomic,copy) NSString *step;
@property (weak, nonatomic) IBOutlet UILabel *screenNumber;
@end
