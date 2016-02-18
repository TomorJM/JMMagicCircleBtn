//
//  JMMagicCircleButton.h
//  JMCircleMagicButton
//
//  Created by joker on 16/2/18.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMMagicCircleButton : UIButton


@property (nonatomic,assign) BOOL isLoading;

@property (nonatomic,strong) UIButton *frontShowBtn;



- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor*)color Title:(NSString *)title;

@end
