//
//  CMListViewTableViewCell.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMListViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

- (void) updateWithImageData:(NSData *)data;
@end
