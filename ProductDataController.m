//
//  ProductDataController.m
//  LCBOAPI_1
//
//  Created by Kunwardeep Gill on 2015-06-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "ProductDataController.h"

@implementation ProductDataController


+ (instancetype)sharedProductManager
{
  static ProductDataController *manager = nil;
  static dispatch_once_t token;
  dispatch_once(&token, ^{
    manager = [[ProductDataController alloc]init];
  });
  return manager;
}



@end
