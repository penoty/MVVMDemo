//
//  RCBaseModel.m
//  MVCDemo
//
//  Created by yupao on 9128/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

#pragma mark - init methods
- (instancetype)initModelWithData:(id)data {
    
    self = [super init];
    if (self) {
        NSDictionary *_data = nil;
        if ([data isKindOfClass:[NSData class]] || [data isKindOfClass:[NSString class]]) {//json_str
            _data = [self getParseJsonToDic:data];
        }else {
            _data = [data copy];
        }
        [self assignModelWithData:_data];
    }
    return self;
    
}

+ (instancetype)modelWithData:(NSDictionary *)data {
    
    BaseModel *baseModel = [[BaseModel alloc] initModelWithData:data];
    return baseModel;
    
}

#pragma mark - model mapping
+ (NSDictionary *)mappingModel {
    
    return nil;
    
}

#pragma mark - model assignment
- (void)assignModelWithData:(NSDictionary *)data {
    
    if (!data) { return; }
    NSDictionary *mappingModel = [[self class] mappingModel];
    unsigned int outCount;
    objc_property_t *propertyArray = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i<outCount; i++) {
        NSString *propertyName = @(property_getName(propertyArray[i]));
        NSString *methodName = [NSString stringWithFormat:@"set%@:",[self firstLetterCapitalize:propertyName]];
        SEL methodSEL = NSSelectorFromString(methodName);
        static void (*setProperty)(id self, SEL sel, id data) = (void(*)(id self, SEL sel, id data))objc_msgSend;
        id propertyValue = mappingModel ? (mappingModel[propertyName] ? data[mappingModel[propertyName]] : data[propertyName]) : data[propertyName];
        if (propertyValue) {
            setProperty(self, methodSEL, propertyValue);
        }
    }
    free(propertyArray);
    
}

- (NSString *)firstLetterCapitalize:(NSString *)str {
    
    return [[[str substringWithRange:NSMakeRange(0, 1)] uppercaseString] stringByAppendingString:[str substringFromIndex:1]];

}

#pragma mark -json 解析
-(NSDictionary*)getParseJsonToDic:(id)resultData {
    
    NSData *data = nil;
    if ([resultData isKindOfClass:[NSString class]]) {
        data= [resultData dataUsingEncoding:NSUTF8StringEncoding];
    }else {
        data = resultData;
    }
    if (!data) {return nil;}
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return jsonObject;
    
}


@end
