//
//  HomeViewModel.h
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HomeCellViewModel.h"
#import "BaseModel.h"

@interface HomeViewModel : NSObject

@property (nonatomic, strong) NSArray *resultArray;
@property (nonatomic, strong) NSNumber *needUpdateUI;

- (void)requestFakeData;

@end
