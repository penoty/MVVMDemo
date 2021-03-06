//
//  HomeView.h
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCellViewModel.h"

@interface HomeCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textView;

- (void)bindingViewModel:(HomeCellViewModel *)model;

@end
