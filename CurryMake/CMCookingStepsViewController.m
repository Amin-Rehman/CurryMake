//
//  CMCookingStepsViewController.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMCookingStepsViewController.h"
#import "CMStepsChildViewController.h"

@interface CMCookingStepsViewController ()

@end

@implementation CMCookingStepsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupPagedViewController];
    
}

- (void)setupPagedViewController {
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    CMStepsChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

- (CMStepsChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    CMStepsChildViewController *stepsChildViewController = [[CMStepsChildViewController alloc] initWithNibName:@"CMStepsChildViewController" bundle:nil];
    stepsChildViewController.index = index;
    stepsChildViewController.step =  [self.item.steps objectAtIndex:index];
    
    return stepsChildViewController;
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.item.steps count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CMStepsChildViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(CMStepsChildViewController *)viewController index];
    
    
    index++;
    
    if (index == [self.item.steps count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

@end
