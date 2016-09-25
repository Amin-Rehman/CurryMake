//
//  CMCookingStepsViewController.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMItem.h"

@interface CMCookingStepsViewController : UIViewController <UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) CMItem *item;
@end
