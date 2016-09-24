//
//  CMItemDataSource.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMItemDataSource.h"


@interface CMItemDataSource()

@end

@implementation CMItemDataSource

- (void)retrieveItemsListWithCompletionBlock:(void(^)(NSArray <CMItem *>*))completionBlock {
    
    CMItemService *service = [[CMItemService alloc] init];
    
    NSMutableArray <CMItem *> *curryMakeItemList = [[NSMutableArray alloc] init];
    
    [service getItemsFromFirebaseWithCompletion:^(NSArray *array){
        
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
