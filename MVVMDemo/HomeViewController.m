//
//  HomeViewController.m
//  MVVMDemo
//
//  Created by yupao on 9/13/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "HomeCell.h"
#import "HomeTableViewDelegateAndDataSource.h"
#import "Masonry.h"
#import "ReactiveObjc.h"


@interface HomeViewController () {
    
}

@property (nonatomic, strong) HomeViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RACSignal *resultSignal;
@property (nonatomic, strong) HomeTableViewDelegateAndDataSource *tableViewDelegateAndDataSource;

@end

@implementation HomeViewController

- (instancetype)initWithViewModel:(HomeViewModel *)viewModel {
    self = [super init];
    if (self) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self initSignals];
}

#pragma mark - init methods
- (void)initSignals {
    @weakify(self);
    [[self rac_signalForSelector:@selector(viewWillAppear:)]
        subscribeNext:^(id  _Nullable x) {
            [_viewModel requestFakeData];
        }
    ];
    _resultSignal = [_viewModel rac_valuesAndChangesForKeyPath:@keypath(_viewModel, resultArray)
                                                       options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
                                                      observer:self];
    [[_resultSignal
        filter:^BOOL(RACTuple *  _Nullable tuple) {
            NSDictionary *changes = tuple.second;
            return changes[NSKeyValueChangeNewKey] ? YES : NO;
        }]
        subscribeNext:^(RACTuple *  _Nullable tuple) {
            @strongify(self);
            _tableViewDelegateAndDataSource.dataSource = _viewModel.resultArray;
            [self updateUI];
        }
    ];
    
    [[RACObserve(_viewModel, needUpdateUI)
        filter:^BOOL(NSNumber *  _Nullable value) {
            return [value boolValue];
        }]
        subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            [self updateUI];
        }
    ];
}

- (void)initTableView {
    _tableView = [[UITableView alloc] init];
    _tableViewDelegateAndDataSource = [[HomeTableViewDelegateAndDataSource alloc] init];
    [_tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"home_cell"];
    [_tableView setDelegate:(id<UITableViewDelegate> _Nullable)_tableViewDelegateAndDataSource];
    [_tableView setDataSource:(id<UITableViewDataSource> _Nullable)_tableViewDelegateAndDataSource];
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)updateUI {
    [_tableView reloadData];
}

@end
