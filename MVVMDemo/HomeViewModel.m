//
//  HomeViewModel.m
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeCellViewModel.h"
static const NSString *kIconUrl = @"http://imgsrc.baidu.com/forum/w%3D580/sign=84badcabf1d3572c66e29cd4ba126352/4f4c9e3df8dcd10034ca7363718b4710b8122fad.jpg";

@implementation HomeViewModel

- (void)requestFakeData {
    NSArray *fakeDataArray = @[
                              @{@"url": kIconUrl,
                                @"title": @"title_1",
                                @"content": @"content_1..."
                                },
                              @{@"url": kIconUrl,
                                @"title": @"title_2",
                                @"content": @"content_2..."
                                },
                              @{@"url": kIconUrl,
                                @"title": @"title_3",
                                @"content": @"content_3..."
                                }
                              ];
    NSMutableArray *tempArray = @[].mutableCopy;
    for (id fakeData in fakeDataArray) {
        HomeCellViewModel *cellViewModel = [[HomeCellViewModel alloc] initWithData:fakeData];
        [[RACObserve(cellViewModel, needUpdateUI)
             filter:^BOOL(NSNumber *value) {
                 return [value boolValue];
             }]
             subscribeNext:^(id  _Nullable x) {
                 self.needUpdateUI = @YES;
             }];
        [tempArray addObject:cellViewModel];
    }
    [self setResultArray:tempArray];
}

@end
