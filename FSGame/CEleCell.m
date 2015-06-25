//
//  CEleCell.m
//  FSGame
//
//  Created by cheng jia on 15/5/11.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CEleCell.h"

@implementation CEleCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        arr=[[NSMutableArray alloc]initWithCapacity:6];
        [self initCell];
    }
    return self;
}
-(void)initCell
{
    eNameLB=[[UILabel alloc]initWithFrame:CGRectMake(15, 10, DEVICEWIDTH /4, HeightScale(20))];
    eNameLB.textColor=Dark_Gray_Color;
    eNameLB.textAlignment=NSTextAlignmentLeft;
    eNameLB.font=[UIFont boldSystemFontOfSize:TSIZE2];
    eNameLB.text=@"Stsq4";
    [self addSubview:eNameLB];
    
    eSNameLB=[[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH /4, 10, DEVICEWIDTH/2, HeightScale(20))];
    eSNameLB.textColor=Middle_Gray_Color;
    eSNameLB.numberOfLines=0;
    eSNameLB.textAlignment=NSTextAlignmentLeft;
    eSNameLB.font=[UIFont systemFontOfSize:TSIZE3];
    eSNameLB.text=@"Step sequence level 4";
    [self addSubview:eSNameLB];
    
    bvLB=[[UILabel alloc]initWithFrame:CGRectMake(DEVICEWIDTH-10-WidthScale(60), 10, WidthScale(60) , HeightScale(20))];
    bvLB.textColor=[UIColor whiteColor];
    bvLB.textAlignment=NSTextAlignmentCenter;
    bvLB.font=[UIFont boldSystemFontOfSize:TSIZE4];
    bvLB.text=@"bv: 13.1";
    bvLB.backgroundColor=Nav_Color;
    bvLB.layer.cornerRadius=HeightScale(10);
    bvLB.layer.masksToBounds=true;
    [self addSubview:bvLB];
    
    float width=WidthScale(20);
    float xpadding=DEVICEWIDTH/8.5;
    float delta=(DEVICEWIDTH*0.8-WidthScale(120))/5;
    for (int i=0; i<6; i++)
    {
        UILabel *goe=[[UILabel alloc]initWithFrame:CGRectMake(xpadding+(delta+width)*i, 10+HeightScale(40), width, width)];
        goe.textColor=[UIColor whiteColor];
        goe.textAlignment=NSTextAlignmentCenter;
        goe.font=[UIFont systemFontOfSize:TSIZE4];
        int num=i<3?i:i+1;
        goe.text=[NSString stringWithFormat:@"%d",num-3];
        goe.backgroundColor=colors[i];
        [self addSubview:goe];
        
        UILabel *value=[[UILabel alloc]initWithFrame:CGRectMake(xpadding+(delta+width)*i-WidthScale(5), 10+HeightScale(60), WidthScale(30), WidthScale(20))];
        value.textColor=Dark_Gray_Color;
        value.textAlignment=NSTextAlignmentCenter;
        value.font=[UIFont systemFontOfSize:TSIZE4];
        value.text=[NSString stringWithFormat:@"%.1f",(num-3)*0.7];
        if (num-3>0)
        {
            value.text=[NSString stringWithFormat:@"+%.1f",(num-3)*0.7];
            goe.text=[NSString stringWithFormat:@"+%d",num-3];
        }
        [self addSubview:value];
        [arr addObject:value];
    }
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
