//
//  ViewController.m
//  JMCircleMagicButton
//
//  Created by joker on 16/2/17.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "ViewController.h"

#import "JMMagicCircleButton.h"




#define cornerRadius1 5

@interface ViewController ()
//@property (nonatomic,strong) UIButton *magicBtn;
@property (nonatomic,strong) UIButton *displayBtn;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *testView;


@property (nonatomic,strong) JMMagicCircleButton *magicBtn;
@property (nonatomic,assign) BOOL isLoading;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    JMMagicCircleButton *btn = [[JMMagicCircleButton alloc] initWithFrame:CGRectMake(100, 200, 150, 40) withColor:[UIColor blueColor] Title:@"登录"];

    [btn addTarget:self action:@selector(btnStart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.magicBtn = btn;


    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    self.magicBtn.isLoading = NO;
    

    
    
}

- (void)btnStart:(JMMagicCircleButton *)btn
{
    
    
    
    btn.isLoading = YES;
}
@end
