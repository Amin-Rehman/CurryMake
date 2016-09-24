//
//  CMItemDataSource.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMItemService.h"

@interface CMItemDataSource : NSObject

- (void)retrieveItemsListWithCompletionBlock:(void(^)(NSArray <CMItem *>*))completionBlock;

@end
