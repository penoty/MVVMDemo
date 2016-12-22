//
//  HomeCellViewModel.m
//  MVVMDemo
//
//  Created by penoty yu on 16/12/2016.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "HomeCellViewModel.h"
#import "SDWebImageManager.h"

@interface HomeCellViewModel ()

@end

@implementation HomeCellViewModel

- (instancetype)initWithData:(id)data {
    self = [super init];
    _title = data[@"title"];
    _content = data[@"content"];
    [self asynDownloadWithURL:data[@"url"]];
    return self;
}

- (void)asynDownloadWithURL:(NSString *)url {
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        _icon = image;
        self.needUpdateUI = @YES;
    }];
}

@end
