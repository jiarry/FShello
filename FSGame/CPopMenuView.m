//
//  CPopMenuView.m
//  FSGame
//
//  Created by 程 佳 on 15/6/20.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import "CPopMenuView.h"
#import "UIImage+FSUI.h"
@implementation MenuItem

-(id)init:(NSString *)ss
{
    self=[super init];
    if (self) {
        self.stitle=ss;
    }
    return self;
}
@end

@implementation CPopMenuView

-(id)initWithFrame:(CGRect)frame  items:(NSArray *)menu
{
    self=[super initWithFrame:frame];
    if (self) {
        menus=[menu mutableCopy];
        [self setUpView];
    }
    return self;
}

-(void)setUpView
{
    for (UIView *subview in self.subviews)
    {
        [subview removeFromSuperview];
    }
    float xpadding=25;
    float width,height;
    width=self.frame.size.width-xpadding*2;
    height=HeightScale(25);
    for (int i=0; i<menus.count; ++i)
    {
        MenuItem *item=menus[i];
        item.frame=CGRectMake(xpadding, xpadding/2+(xpadding/2+height)*i, width, height);
        [item setTitle:item.stitle forState:UIControlStateNormal];
        item.titleLabel.font=[UIFont systemFontOfSize:TSIZE3];
        [item setTitleColor:Nav_Color forState:UIControlStateNormal];
        item.layer.borderColor=Nav_Color.CGColor;
        item.layer.borderWidth=1;
        item.layer.cornerRadius=HeightScale(12.5);
        item.layer.masksToBounds=true;
        item.tag=100+i;
        [item setBackgroundImage:[UIImage imageWithColor:Light_Gray_Color] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
        if (item.isSelected)
        {
            [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [item setBackgroundImage:[UIImage imageWithColor:Nav_Color] forState:UIControlStateNormal];
        }
        
        [self addSubview:item];
    }
}

-(void)itemSelected:(id)sender
{
    MenuItem *item=sender;
    for (MenuItem *it in menus)
    {
        it.isSelected=false;
    }
    item.isSelected=true;
    [self setUpView];
    NSInteger tag=item.tag-100;
    [self.delegate menuItemSelected:tag];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
