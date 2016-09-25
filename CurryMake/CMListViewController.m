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
#import "CMIngredientsViewController.h"
#import "CMListViewTableViewCell.h"
#import "CMImageService.h"

@interface CMListViewController ()
@property (nonatomic, strong) CMItemDataSource *dataSource;
@property (nonatomic, strong) NSArray <CMItem *> *curryItems;
@property (nonatomic, strong) CMItem *selectedItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation CMListViewController

static NSString * const cellSelectedSegueIdentifier = @"cellSelectedSegue";

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:cellSelectedSegueIdentifier]) {
        CMIngredientsViewController *ingredientsViewController = (CMIngredientsViewController *)segue.destinationViewController;
        ingredientsViewController.item = self.selectedItem;
    }
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.curryItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    __block CMListViewTableViewCell *cell = (CMListViewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    CMItem *item = [self.curryItems objectAtIndex:indexPath.row];
    
    [cell.cellLabel setText:item.name];
    [cell.activityIndicator startAnimating];
    
    
    [CMImageService getImageFromPath:item.imageURL
                     completionBlock:^(NSData *data) {
                         dispatch_async(dispatch_get_main_queue(),^{
                             [cell updateWithImageData:data];
                         });
                     }];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

#pragma mark - UITableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.curryItems count] > 0) {
        self.selectedItem = [self.curryItems objectAtIndex:indexPath.row];
        [self performSegueWithIdentifier:cellSelectedSegueIdentifier sender:self];
    }
}

@end
