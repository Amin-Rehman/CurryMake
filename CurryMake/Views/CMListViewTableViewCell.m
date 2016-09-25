//
//  CMListViewTableViewCell.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 25/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMListViewTableViewCell.h"

@interface CMListViewTableViewCell()
@end

@implementation CMListViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:animated];
}

- (void) updateWithImageData:(NSData *)data {
    [self.cellImageView setImage:[UIImage imageWithData:data]];
    [self.cellImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.cellImageView.layer.cornerRadius = 6.0f;
    [self.activityIndicator stopAnimating];
}

- (void)prepareForReuse {
    [self.cellImageView setImage:nil];
}

@end
