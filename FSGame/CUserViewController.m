//
//  CUserViewController.m
//  FSGame
//
//  Created by 程 佳 on 15/6/21.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CUserViewController.h"
#import "CUserBasicInfoView.h"
@interface CUserViewController ()<CUserBasicInfoViewDelegate>
{
    CUserBasicInfoView *userInfoView;
}
@end

@implementation CUserViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    userInfoView=[[CUserBasicInfoView alloc]initWithFrame:CGRectMake(0, 20, DEVICEHIGHT, HeightScale(200))];
    userInfoView.delegate=self;
    [self.navigationController.view addSubview:userInfoView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)returnBtClicked
{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [userInfoView removeFromSuperview];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
