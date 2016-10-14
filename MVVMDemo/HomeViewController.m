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

@interface HomeViewController () {
    
}

@property (nonatomic, strong) HomeViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomeTableViewDelegateAndDataSource *tableViewDelegateAndDataSource;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addListeners];
    [self initTableView];
    [self initViewModel];
    
}

#pragma mark - init methods
- (void)initViewModel {
    
    _viewModel = [[HomeViewModel alloc] initWithTarget:self];
    [_viewModel requestFakeData];
    
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

- (void)addListeners {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modelDidUpdate:) name:@"ModelUpdate" object:nil];
    
}

#pragma mark - observer
- (void)modelDidUpdate:(NSNotification *)notification {
    
    _tableViewDelegateAndDataSource.dataSource = _viewModel.modelArray;
    [self updateUI];
    
}


- (void)updateUI {
    
    [_tableView reloadData];

}

@end
