//
//  HomeViewController.h
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"
#import "ReactiveObjC.h"

@interface HomeViewController : UIViewController

- (instancetype)initWithViewModel:(HomeViewModel *)viewModel;

@end
