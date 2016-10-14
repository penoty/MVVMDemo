//
//  RCBaseModel.h
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <Objc/runtime.h>
#import <objc/message.h>

@interface BaseModel : NSObject

+ (instancetype)modelWithData:(id)data;
- (instancetype)initModelWithData:(id)data;

@end
