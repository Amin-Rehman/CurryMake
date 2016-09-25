//
//  CMStepsChildViewController.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMStepsChildViewController.h"

@interface CMStepsChildViewController ()
@property (weak, nonatomic) IBOutlet UITextView *stepsTextView;

@end

@implementation CMStepsChildViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.screenNumber.text = [NSString stringWithFormat:@"%ld",(long)(self.index+1)];
    self.stepsTextView.text = self.step;
}

@end
