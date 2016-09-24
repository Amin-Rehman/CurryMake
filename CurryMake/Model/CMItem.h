//
//  CMItem.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMItem : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,strong) NSMutableArray *ingredients;
@property (nonatomic,strong) NSMutableArray *steps;
@property (nonatomic,copy) NSString *imageURL;

- (instancetype)initWithName:(NSString *)name ingredients:(NSArray *)ingredients steps:(NSArray *)steps image:(NSString *)imageURL;
@end
