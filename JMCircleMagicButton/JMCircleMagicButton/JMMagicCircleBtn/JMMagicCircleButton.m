//
//  JMMagicCircleButton.m
//  JMCircleMagicButton
//
//  Created by joker on 16/2/18.
//  Copyright © 2016年 TomorJM. All rights reserved.
//

#import "JMMagicCircleButton.h"
#import "MMMaterialDesignSpinner.h"


@interface JMMagicCircleButton ()

@property (nonatomic,strong) UIView *bgView;



@property (nonatomic,strong) MMMaterialDesignSpinner *spinnerView;


@property (nonatomic,assign) BOOL hasStarted;


@property (nonatomic,assign) CGSize defaultSize;

@end

@implementation JMMagicCircleButton


#define defaultCircleR 3


- (instancetype)initWithFrame:(CGRect)frame withColor:(UIColor*)color Title:(NSString *)title;
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultSettingWithFrame:frame andColor:color Title:title];
    }
    return self;
}



- (void)initDefaultSettingWithFrame:(CGRect)frame andColor:(UIColor *)color Title:(NSString *)title
{
    _isLoading = NO;
    self.hasStarted = NO;
    
    self.clipsToBounds = NO;
    
    self.defaultSize = frame.size;
    

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    bgView.backgroundColor = color;
    bgView.userInteractionEnabled = NO;
    bgView.layer.cornerRadius = defaultCircleR;
    [self addSubview:bgView];
    self.bgView = bgView;
    
    //小转圈
    MMMaterialDesignSpinner *spinnerView = [[MMMaterialDesignSpinner alloc] initWithFrame:CGRectZero];
    self.spinnerView = spinnerView;
    self.spinnerView.bounds = CGRectMake(0, 0, self.defaultSize.height*0.8, self.defaultSize.height*0.8);
    self.spinnerView.tintColor = [UIColor whiteColor];
    self.spinnerView.lineWidth = 2;
    self.spinnerView.center = CGPointMake(CGRectGetMidX(self.layer.bounds), CGRectGetMidY(self.layer.bounds));
    self.spinnerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.spinnerView.userInteractionEnabled = NO;
    [self addSubview:self.spinnerView];
    
    
    
    UIButton *frontShowBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    frontShowBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    frontShowBtn.userInteractionEnabled = NO;
    [frontShowBtn setTitle:title forState:UIControlStateNormal];
    [self addSubview:frontShowBtn];
//    [self bringSubviewToFront:frontShowBtn];
    self.frontShowBtn = frontShowBtn;

}


- (void)setIsLoading:(BOOL)isLoading
{
    
    
    
    
    _isLoading = isLoading;
    

    //加载中
    if (isLoading) {
        
        
        if (self.hasStarted) {
            return;
        }
        

        
        CGFloat expansionP = 1.2;
        CGFloat circleD = self.bgView.bounds.size.height;
        
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.4 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.bgView.layer.cornerRadius = circleD * 0.5;
            self.bgView.layer.bounds = CGRectMake(0, 0, expansionP * self.bgView.bounds.size.width,expansionP * self.bgView.bounds.size.height);
        } completion:^(BOOL finished) {
            
            
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.bgView.layer.bounds = CGRectMake(0, 0, circleD, circleD);
                self.frontShowBtn.hidden = YES;
                [self.spinnerView startAnimating];
            } completion:^(BOOL finished) {
                self.bgView.layer.shadowColor = [UIColor yellowColor].CGColor;
                self.bgView.layer.shadowOffset = CGSizeMake(0, 0);
                self.bgView.layer.shadowRadius = 5;
                self.bgView.layer.shadowOpacity = 1;
                CABasicAnimation *animation = [CABasicAnimation animation];
                animation.keyPath = @"transform.scale";
                animation.fromValue = @1;
                animation.toValue = @1.2;
                animation.repeatCount = MAXFLOAT;
                animation.duration = 0.7;
                animation.fillMode = kCAFillModeForwards;
                [self.bgView.layer addAnimation:animation forKey:@"transform.scale"];
                
                
                
                self.hasStarted = YES;
            }];
            
        }];

    }
    
    //停止加载
    if (!isLoading) {
        
        
        if (_hasStarted) {
            [self.bgView.layer removeAnimationForKey:@"transform.scale"];
            self.bgView.layer.shadowOpacity = 0;
            CGFloat expansionP = 1.2;
            
            [UIView animateWithDuration:0.3 delay:0.5 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.frontShowBtn.hidden = NO;
                [self.spinnerView stopAnimating];

                self.bgView.layer.bounds = CGRectMake(0, 0, expansionP * self.defaultSize.width,expansionP * self.defaultSize.height);
                self.bgView.layer.cornerRadius = defaultCircleR;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
                    self.bgView.layer.cornerRadius = defaultCircleR;
                    self.bgView.bounds = CGRectMake(0, 0, self.defaultSize.width, self.defaultSize.height);
                } completion:^(BOOL finished) {
                    _isLoading = NO;
                    _hasStarted = NO;
                }];
            }];
            
        }

        }
        
   
    
}
@end
