//
//  NormalListController.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/14.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NormalListController.h"
#import "MineInfoController.h"
#import "QQAppController.h"
#import "QQZoneController.h"
#import "ZhiHuController.h"

@interface NormalListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation NormalListController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"常用";
    [self.view addSubview:self.tableView];
}

#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = nil;
    switch (indexPath.row) {
        case 0:
            str = @"个人中心";
            break;
        case 1:
            str = @"类似qq应用空间效果";
            break;
        case 2:
            str = @"类似QQ空间效果";
            break;
        case 3:
            str = @"知乎日报";
            break;
        case 4:
            str = @"QQ我的资料页";
            break;
        case 5:
            str = @"蚂蚁森林";
            break;
        
        default:
            break;
    }
    cell.textLabel.text = str;
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            MineInfoController *mineInfoVC = [MineInfoController new];
            [self.navigationController pushViewController:mineInfoVC animated:YES];
        }
            break;
        case 1:
        {
            QQAppController *qqAppVC = [QQAppController new];
            [self.navigationController pushViewController:qqAppVC animated:YES];
        }
            break;
        case 2:
        {
            QQZoneController *qqZoneVC = [QQZoneController new];
            [self.navigationController pushViewController:qqZoneVC animated:YES];
        }
            break;
        case 3:
        {
            ZhiHuController *zhiHuVC = [ZhiHuController new];
            [self.navigationController pushViewController:zhiHuVC animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
