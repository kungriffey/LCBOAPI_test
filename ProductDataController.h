//
//  ProductDataController.h
//  LCBOAPI_1
//
//  Created by Kunwardeep Gill on 2015-06-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductDataController : NSObject


+ (instancetype)sharedProductManager;


//  Get Product Data
- (void)getProductSuccess:(void (^)(NSArray *))success onFailure:(void (^)(NSError *))failure;





@end
