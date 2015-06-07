//
//  ViewController.m
//  LCBOAPI_1
//
//  Created by Kunwardeep Gill on 2015-06-07.
//  Copyright (c) 2015 ProjectDGW. All rights reserved.
//

#import "ViewController.h"
#import "ProductDataController.h"

@interface ViewController ()

@end

@implementation ViewController
{
  
  NSMutableArray *products;
}
- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated {
  
  [super viewWillAppear:animated];
  [[ProductDataController sharedProductManager] getProductSuccess:^(id productList) {
    products = productList;
    [self reloadInputViews];
  } onFailure:^(NSError *error) {
    
  }];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
