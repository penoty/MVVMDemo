//
//  HomeCellViewModel.h
//  MVVMDemo
//
//  Created by penoty yu on 16/12/2016.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveObjC.h"

@interface HomeCellViewModel : NSObject

@property (nonatomic, strong, readonly) UIImage *icon;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *content;

@property (nonatomic, strong) NSNumber *needUpdateUI;

- (instancetype)initWithData:(NSDictionary *)data;

@end


