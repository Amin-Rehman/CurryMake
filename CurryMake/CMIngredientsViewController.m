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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;
@property (weak, nonatomic) IBOutlet UILabel *ingredientsLabelTitle;

@end

@implementation CMIngredientsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.ingredientsTextView setText:self.item.ingredients];
    [self.ingredientsTextView setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0f]];
    [self.ingredientsTextView setContentOffset:CGPointMake(0,0)];
    
    [self.ingredientsLabelTitle setText:self.item.name];
    [self.ingredientsLabelTitle setFont:[UIFont boldSystemFontOfSize:18]];
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
    
    [self.loadingIndicator startAnimating];
    
    [CMImageService getImageFromPath:self.item.imageURL completionBlock:^(NSData *imageData){
        __strong CMIngredientsViewController *strongSelf = weakSelf;
        
        dispatch_async(dispatch_get_main_queue(),^{
            if(strongSelf) {
                [strongSelf.curryImageView setImage:[UIImage imageWithData:imageData]];
                strongSelf.curryImageView.contentMode = UIViewContentModeScaleAspectFit;
                [strongSelf.loadingIndicator stopAnimating];
            }
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
