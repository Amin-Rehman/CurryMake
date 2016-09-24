//
//  ViewController.m
//  CurryMake
//
//  Created by Amin Ur Rehman on 24/09/2016.
//  Copyright © 2016 Yaberwock. All rights reserved.
//
#import "CMItemDataSource.h"
#import "CMItem.h"
#import "CMListViewController.h"

@interface CMListViewController ()
@property (nonatomic, strong) CMItemDataSource *dataSource;
@property (nonatomic, strong) NSArray <CMItem *> *curryItems;
@end

@implementation CMListViewController

# pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataSource retrieveItemsListWithCompletionBlock:^(NSArray <CMItem *>* items){
        self.curryItems = [items mutableCopy];
    }];
}

- (CMItemDataSource *)dataSource {
    if(!_dataSource) {
        _dataSource = [[CMItemDataSource alloc] init];
    }
    return _dataSource;
}

- (void)setCurryItems:(NSArray<CMItem *> *)curryItems {
    if(!_curryItems) {
        _curryItems = [[NSArray alloc] init];
    }
    _curryItems = curryItems;
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.curryItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
    cell.textLabel.text = [self.curryItems objectAtIndex:indexPath.row].name;
    
    return cell;
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


@end
