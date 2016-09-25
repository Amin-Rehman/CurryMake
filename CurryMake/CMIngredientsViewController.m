//
//  CMIngredientsViewController.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMIngredientsViewController.h"
#import "CMImageService.h"

@interface CMIngredientsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;
@property (weak, nonatomic) IBOutlet UIImageView *curryImageView;
@property (strong, nonatomic) UIActivityIndicatorView *waitIndicator;

@end

@implementation CMIngredientsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ingredientsTextView setText:self.item.ingredients];
    [self.ingredientsTextView setContentOffset:CGPointMake(0,0)];
    
    [self updateImageView];

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    static NSString * const startCookingSegue = @"startCookingSegue";
    
    if([segue.identifier isEqualToString:startCookingSegue]) {
        CMCookingStepsViewController *cookingStepsViewController = (CMCookingStepsViewController *)segue.destinationViewController;
        cookingStepsViewController.item = self.item;
    }
}

- (void)updateImageView {
    __weak CMIngredientsViewController *weakSelf = self;
    
    self.waitIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.waitIndicator startAnimating];
    [self.waitIndicator setCenter:self.curryImageView.center];
    [self.view addSubview:self.waitIndicator];
    
    [CMImageService getImageFromPath:self.item.imageURL completionBlock:^(NSData *imageData){
        __strong CMIngredientsViewController *strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(),^{
            if(strongSelf) {
                [strongSelf.curryImageView setImage:[UIImage imageWithData:imageData]];
                strongSelf.curryImageView.contentMode = UIViewContentModeScaleAspectFit;
                [strongSelf.waitIndicator removeFromSuperview];
                strongSelf.waitIndicator = nil;                
            }
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
