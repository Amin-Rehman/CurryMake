//
//  CMImageService.h
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMImageService : NSObject
+ (void)getImageFromPath:(NSString *)path completionBlock:(void(^)(NSData *))completionBlock;
@end
