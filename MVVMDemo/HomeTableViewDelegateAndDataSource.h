//
//  HomeTableViewDelegateAndDataSource.h
//  MVVMDemo
//
//  Created by yupao on 9/14/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeTableViewDelegateAndDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) NSArray *dataSource;

@end
