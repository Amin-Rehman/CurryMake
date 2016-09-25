//
//  CMItemDataSource.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMItemDataSource.h"


@interface CMItemDataSource()
@property (nonatomic, strong) CMItemService *service;

@end

@implementation CMItemDataSource

#pragma mark - Lifecycle
- (CMItemService *)service {
    if(!_service){
        _service = [[CMItemService alloc] init];
    }
    return _service;
}

#pragma mark - Item retrieval helper method
- (void)retrieveItemsListWithCompletionBlock:(void(^)(NSArray <CMItem *>*))completionBlock {    
    NSMutableArray <CMItem *> *curryMakeItemList = [[NSMutableArray alloc] init];
    
    [self.service getItemsFromFirebaseWithCompletion:^(NSArray *array){
        
        for(NSDictionary *item in array) {
            
            CMItem *curryMakeItem = [[CMItem alloc] initWithName:[item objectForKey:@"name"]
                                                     ingredients:[item objectForKey:@"ingredients"]
                                                           steps:[item objectForKey:@"steps"]
                                                           image:[item objectForKey:@"imageURL"]];
            [curryMakeItemList addObject:curryMakeItem];
            
            if(completionBlock){
                completionBlock(curryMakeItemList);
            }
            
        }
    }];

    
}

@end
