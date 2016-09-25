//
//  CMItem.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMItem.h"

@interface CMItem()
@end

@implementation CMItem

#pragma mark - Lifecycle 

- (instancetype)initWithName:(NSString *)name ingredients:(NSString *)ingredients steps:(NSArray *)steps image:(NSString *)imageURL {
    self = [super init];
    if(self) {
        _name = name;
        _ingredients = ingredients;
        _steps = [steps mutableCopy];
        _imageURL = imageURL;
        
    }
    return self;
}

- (NSMutableArray *)steps {
    if(!_steps){
        _steps = [[NSMutableArray alloc] init];
    }
    return _steps;
}


@end
