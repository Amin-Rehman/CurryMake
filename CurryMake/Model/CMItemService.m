//
//  CMItemService.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

@import FirebaseDatabase;
#import "CMItemService.h"


@interface CMItemService()
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

@implementation CMItemService


- (void) getItemsFromFirebaseWithCompletion:(void(^)(NSArray *))completionBlock {
    
    self.ref = [[FIRDatabase database] reference];
    
    [self.ref observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSArray *postArray = snapshot.value;
        
        if(completionBlock) {
            completionBlock(postArray);
        }
        

    }];
        
}

@end
