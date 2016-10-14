//
//  HomeView.m
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "HomeCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#define VIEW_GAP 5.0f

@implementation HomeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _iconView = [[UIImageView alloc] init];
        
        _titleLabel = [[UILabel alloc] init];
        
        _textView = [[UITextView alloc] init];
        
        [self addSubview:_iconView];
        [self addSubview:_titleLabel];
        [self addSubview:_textView];
        
    }
    return self;
    
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_iconView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.equalTo(self).with.offset(VIEW_GAP);
        make.size.mas_equalTo(CGSizeMake(50.f, 50.f));
        
    }];
    
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_iconView.mas_right).with.offset(VIEW_GAP);
        make.centerY.equalTo(_iconView);
        make.height.equalTo(_iconView);
        make.right.equalTo(self).with.offset(VIEW_GAP);
        
    }];
    
    [_textView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(_iconView.frame.size.height + VIEW_GAP*2, VIEW_GAP, -VIEW_GAP, -VIEW_GAP));
        
    }];
    
}

- (void)updateModel:(HomeModel *)model {
    
    [_iconView sd_setImageWithURL:[NSURL URLWithString:model.url]];
    [_titleLabel setText:model.title ? model.title : @"无标题"];
    [_textView setText:model.content ? model.content : @"无内容"];
    
}

@end
