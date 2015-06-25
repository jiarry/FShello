//
//  CUserBasicInfoView.m
//  FSGame
//
//  Created by 程 佳 on 15/6/22.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CUserBasicInfoView.h"

@implementation CUserBasicInfoView

-(id)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor=[UIColor whiteColor];
        [self initViews];
    }
    return self;
}
-(void)initViews
{
    UIImageView *bgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width,self.frame.size.height)];
    bgView.image=[UIImage imageNamed:@"bg_linear_gradient"];
    [self addSubview:bgView];
    
    avatarView=[[UIImageView alloc]initWithFrame:CGRectMake(DEVICEWIDTH/2-WidthScale(40), HeightScale(30), WidthScale(80), WidthScale(80))];
    avatarView.image=[UIImage imageNamed:@"profile"];
    avatarView.layer.cornerRadius=WidthScale(40);
    avatarView.layer.masksToBounds=true;
    avatarView.layer.borderWidth=WidthScale(2.5);
    avatarView.layer.borderColor=[UIColor whiteColor].CGColor;// [UIColor colorWithRed:40/255.0 green:180/255.0 blue:84/255.0 alpha:0.5].CGColor;
    [self addSubview:avatarView];
    
    userName=[[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH/2-WidthScale(100), HeightScale(115), WidthScale(200), HeightScale(20))];
    userName.text=@"visitor";
    userName.textColor=[UIColor whiteColor];
    userName.textAlignment=NSTextAlignmentCenter;
    userName.font=[UIFont boldSystemFontOfSize:TSIZE1];
    [self addSubview:userName];
    
    jugeLevel=[[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH/2-WidthScale(100), HeightScale(5), WidthScale(200), HeightScale(20))];
    jugeLevel.text=@"ISU Judge";
    jugeLevel.textColor= [UIColor lightTextColor];
    jugeLevel.textAlignment=NSTextAlignmentCenter;
    jugeLevel.font=[UIFont systemFontOfSize: TSIZE4];
    [self addSubview:jugeLevel];
    
    UIButton *closeButton=[[UIButton alloc]initWithFrame:CGRectMake(15, 15, WidthScale(24), WidthScale(24))];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [self addSubview:closeButton];
    [closeButton addTarget:self  action:@selector(popParentController) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line1=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-HeightScale(52), self.frame.size.width, HeightScale(2))];
    line1.backgroundColor=[UIColor lightTextColor];
    [self addSubview:line1];
    
    float width=DEVICEWIDTH/3.0;
    for (int i=0; i<2; i++)
    {
        UIView *line2=[[UIView alloc]initWithFrame:CGRectMake(width+width*i, self.frame.size.height-HeightScale(50), HeightScale(2), HeightScale(50))];
        line2.backgroundColor=[UIColor lightTextColor];
        [self addSubview:line2];
    }
}

-(void) popParentController
{
    //[self removeFromSuperview];
    [self.delegate returnBtClicked];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
