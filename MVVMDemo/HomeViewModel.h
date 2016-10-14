//
//  HomeViewModel.h
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *modelArray;

- (instancetype)initWithTarget:(id)target;
- (void)requestFakeData;

@end
