//
//  CMImageService.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//

#import "CMImageService.h"

@implementation CMImageService

+ (void)getImageFromPath:(NSString *)path completionBlock:(void(^)(NSData *))completionBlock {
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:path]];
        
        if(completionBlock) {
            completionBlock(imageData);
        }
        
    });
}

@end
