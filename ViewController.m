//
//  ViewController.m
//  Animation
//
//  Created by luoyan on 15/10/16.
//  Copyright (c) 2015年 luoyan. All rights reserved.
//

#import "ViewController.h"
#import "GameCenterViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tableViewList;
    NSArray *demoArrary;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画Demo";
    [self loadSubView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loadSubView
{
    demoArrary = @[@"gameCenter效果"];
    
    tableViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mScreenWidth, self.view.frame.size.height)];
    tableViewList.delegate = self;
    tableViewList.dataSource = self;
    [tableViewList registerClass:[UITableViewCell class] forCellReuseIdentifier:@"demoListCell"];
    [self.view addSubview:tableViewList];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GameCenterViewController *gameVC = [[GameCenterViewController alloc] init];
    [self.navigationController pushViewController:gameVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return demoArrary.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"demoListCell"];
    cell.textLabel.text = [demoArrary objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
