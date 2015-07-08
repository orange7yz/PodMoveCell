//
//  ViewController.m
//  MoveCellDemo
//
//  Created by yongzhang on 15/7/8.
//  Copyright (c) 2015年 yongzhang. All rights reserved.
//

#import "ViewController.h"
#import "LongCell.h"
#import "LongModel.h"
#import "ShortCell.h"
#import "ShortModel.h"
#import "FMMoveTableView.h"

@interface ViewController ()<FMMoveTableViewDataSource,FMMoveTableViewDelegate>

@property (weak, nonatomic) IBOutlet FMMoveTableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self setUp];
}

- (void)setData
{
    self.dataSource = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10 ; i ++) {
        NSObject *model = arc4random() % 2 == 0?[LongModel new]:[ShortModel new];
        [self.dataSource addObject:model];
    }
}

- (void)setUp
{

    [self.tableView registerNib:[UINib nibWithNibName:@"LongCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([LongCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShortCell" bundle:nil] forCellReuseIdentifier:NSStringFromClass([ShortCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [self.tableView adaptedIndexPathForRowAtIndexPath:indexPath];
    if([self.dataSource[indexPath.row] isKindOfClass:[LongModel class]]) {
        LongCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LongCell class])];
        return cell;
    }
    if([self.dataSource[indexPath.row] isKindOfClass:[ShortModel class]]) {
        ShortCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ShortCell class])];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    indexPath = [self.tableView adaptedIndexPathForRowAtIndexPath:indexPath];
    if([self.dataSource[indexPath.row] isKindOfClass:[LongModel class]]) {
        return [LongCell heigthForCell];
    }
    if([self.dataSource[indexPath.row] isKindOfClass:[ShortModel class]]) {
        return [ShortCell heightForCell];
    }
    return 0;
}

- (void)moveTableView:(FMMoveTableView *)tableView moveRowFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSObject *obj = self.dataSource[fromIndexPath.row];
    [self.dataSource removeObject:obj];
    [self.dataSource insertObject:obj atIndex:toIndexPath.row];
}

@end
