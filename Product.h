//
//  Product.h
//  LCBOAPI_1
//
//  Created by Kunwardeep Gill on 2015-06-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *drinkName;
@property (strong, nonatomic) NSString *drinkTastingNote;
@property (strong, nonatomic) NSString *drinkProducerName;
@property (strong, nonatomic) NSString *drinkSecondaryCategory;
@property (strong, nonatomic) NSString *drinkPrimaryCategory;
@property (strong, nonatomic) NSString *drinkOrigin;
@property (strong, nonatomic) NSString *drinkTertiaryCategory;
@property (strong, nonatomic) NSString *drinkVarietal;
@property (strong, nonatomic) NSString *drinkPackage;


@end
