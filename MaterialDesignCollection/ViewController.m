//
//  ViewController.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/4.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "Defines.h"
#import "ButtonVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSArray alloc] initWithObjects:@"按钮", nil];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEM_WIDTH, SCREEM_HEIGHT-64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, SCREEM_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:lineView];
    
    cell.textLabel.text = _items[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        ButtonVC *vc = [[ButtonVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end