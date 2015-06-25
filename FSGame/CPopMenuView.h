//
//  CPopMenuView.h
//  FSGame
//
//  Created by 程 佳 on 15/6/20.
//  Copyright (c) 2015年 cheng jia. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CPopMenuViewDelegate <NSObject>

-(void) menuItemSelected:(NSInteger)index;

@end

@interface MenuItem : UIButton

@property(nonatomic,copy)NSString *stitle;
@property(nonatomic,assign)BOOL isSelected;
-(id)init:(NSString *)ss;
@end

@interface CPopMenuView : UIView
{
    NSMutableArray *menus;
}
-(id)initWithFrame:(CGRect)frame  items:(NSArray *)menu;

@property(nonatomic,weak)id<CPopMenuViewDelegate> delegate;
@end
