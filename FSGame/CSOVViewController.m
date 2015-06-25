//
//  CSOVViewController.m
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CSOVViewController.h"
#import "SlideNavigationController.h"
#import "CEleCell.h"
@interface CSOVViewController ()<SlideNavigationControllerDelegate>

@end

@implementation CSOVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavigationTitle:@"Scales Of Value"];
    table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHIGHT-64)];
    table.dataSource=self;
    table.delegate=self;
    [self.view addSubview:table];
    
    //self.navigationController.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_indicator"] style:UIBarButtonItemStylePlain target:self action:@selector(showMenu:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showMenu:(id)sender
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HeightScale(80)+20;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CEleCell *eleCell=[tableView dequeueReusableCellWithIdentifier:@"CEleCell"];
    if (eleCell==nil) {
        eleCell=[[CEleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CEleCell"];
    }
    return eleCell;
}
#pragma mark - SlideNavigationController Methods -

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return YES;
}
-(void)slideNavigationControllerRightMenuTapped:(id)sender
{
    
}
@end
