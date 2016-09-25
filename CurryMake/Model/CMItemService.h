//
//  CMItemService.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMItem.h"

@interface CMItemService : NSObject
- (void) getItemsFromFirebaseWithCompletion:(void(^)(NSArray *))completionBlock;
@end
