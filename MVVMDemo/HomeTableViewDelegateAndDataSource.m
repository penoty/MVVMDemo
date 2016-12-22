//
//  HomeTableViewDelegateAndDataSource.m
//  MVVMDemo
//
//  Created by yupao on 9/14/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "HomeTableViewDelegateAndDataSource.h"
#import "HomeCell.h"
#import "ReactiveObjc.h"
#import "UIImageView+WebCache.h"

#define SECTION_NUMBER 1
#define ROW_HEIGHT 100.f

@implementation HomeTableViewDelegateAndDataSource

#pragma  mark -tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return SECTION_NUMBER;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home_cell" forIndexPath:indexPath];
    __block NSNumber *index = @(indexPath.row);
    @weakify(self);
    [cell bindingViewModel:_dataSource[indexPath.row]];
    [cell.textView.rac_textSignal subscribeNext:^(NSString * _Nullable text) {
        @strongify(self);
        HomeCellViewModel *model = self.dataSource[[index integerValue]];
        model.content = text;
    }];
    return cell;
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ROW_HEIGHT;
}


@end
