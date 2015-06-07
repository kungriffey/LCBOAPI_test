//
//  ProductDataController.m
//  LCBOAPI_1
//
//  Created by Kunwardeep Gill on 2015-06-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "ProductDataController.h"
#import "Product.h"

@implementation ProductDataController
{
  
  NSMutableArray *productName;
  NSMutableArray *productData;
}

+ (instancetype)sharedProductManager
{
  static ProductDataController *manager = nil;
  static dispatch_once_t token;
  dispatch_once(&token, ^{
    manager = [[ProductDataController alloc]init];
  });
  return manager;
}


- (void)getProductSuccess:(void (^)(NSArray *))success onFailure:(void (^)(NSError *))failure
{
  NSString *APILogin = @"https://lcboapi.com/products/?access_key=MDo1NjBmYzM1Mi0wYmE2LTExZTUtOWVhYy1lYjVlZmIyY2M1Zjg6UklHdGZXQXF1OEtLcFE3VGgxUDJ3MlBVcVRZQVBvYVRIblRa";
  //NSString *APILogin = @"https://lcboapi.com/products/428334?access_key=MDo1NjBmYzM1Mi0wYmE2LTExZTUtOWVhYy1lYjVlZmIyY2M1Zjg6UklHdGZXQXF1OEtLcFE3VGgxUDJ3MlBVcVRZQVBvYVRIblRa";
  NSString *requestString = [NSString stringWithFormat:@"%@", APILogin];
  NSURL *requestURL = [NSURL URLWithString:requestString];
  NSURLSession *session = [NSURLSession sharedSession];
  
  [[session dataTaskWithURL:requestURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      failure(error);
      return;
    }
    NSError *er = nil;
    if (er) {
      failure(er);
      return;
    }
    
    NSArray *productResponseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&er];
    //NSLog(@"%@",response);
    productName = [[NSMutableArray alloc]init];
    productData = [[NSMutableArray alloc]init];
    
    NSArray *requestResults = [productResponseObject valueForKey:@"result"];
    //NSLog(@"%@", requestResults);
    
    for (NSDictionary *resultsDictionary in requestResults) {
      Product *drink = [[Product alloc] init];
      drink.drinkName = [resultsDictionary objectForKey:@"name"];
      drink.drinkOrigin = [resultsDictionary objectForKey:@"origin"];
      drink.drinkPackage = [resultsDictionary objectForKey:@"package"];
      drink.drinkPrimaryCategory = [resultsDictionary objectForKey:@"primary_category"];
      drink.drinkSecondaryCategory = [resultsDictionary objectForKey:@"secondary_category"];
      drink.drinkProducerName = [resultsDictionary objectForKey:@"producer_name"];
      drink.drinkTastingNote = [resultsDictionary objectForKey:@"tasting_note"];
      drink.drinkTertiaryCategory = [resultsDictionary objectForKey:@"tertiary_category"];
      drink.drinkVarietal = [resultsDictionary objectForKey:@"varietal"];
      [productData addObject:drink];
    }
    NSLog(@"%@", productData);
    success(productData);
  }] resume];


}



@end
