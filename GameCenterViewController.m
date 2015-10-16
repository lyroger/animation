//
//  GameCenterViewController.m
//  Animation
//
//  Created by luoyan on 15/10/16.
//  Copyright (c) 2015年 luoyan. All rights reserved.
//

#import "GameCenterViewController.h"

@interface GameCenterViewController ()
{
    UIButton *gameView;
}

@end

@implementation GameCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GameCenter动画效果";
    [self loadSubView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadSubView
{
    self.view.backgroundColor = [UIColor whiteColor];
    float width = 140;
    gameView = [UIButton buttonWithType:UIButtonTypeCustom];
    gameView.frame = CGRectMake((mScreenWidth-width)/2, (self.view.frame.size.height-width)/2, width, width);
    gameView.backgroundColor = [UIColor blueColor];
    gameView.layer.cornerRadius = width/2;
    [self.view addSubview:gameView];
    
    [self addAniamtion];
}


//加载动画效果
-(void)addAniamtion{
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = INFINITY;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 6.0;
    
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGFloat amplitude = 10;
    CGRect circleContainer = CGRectInset(gameView.frame, gameView.bounds.size.width / 2 - amplitude, gameView.bounds.size.width / 2 - amplitude);
    CGPathAddEllipseInRect(curvedPath, NULL, circleContainer);
    
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    [gameView.layer addAnimation:pathAnimation forKey:@"gameCenterAnimation"];
    
    
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.duration = 1;
    scaleX.values = @[@1.0, @1.1, @1.0];
    scaleX.keyTimes = @[@0.0, @0.5, @1.0];
    scaleX.repeatCount = INFINITY;
    scaleX.autoreverses = YES;
    
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [gameView.layer addAnimation:scaleX forKey:@"scaleX"];
    
    
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 1.5;
    scaleY.values = @[@1.0, @1.1, @1.0];
    scaleY.keyTimes = @[@0.0, @0.5, @1.0];
    scaleY.repeatCount = INFINITY;
    scaleY.autoreverses = YES;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [gameView.layer addAnimation:scaleY forKey:@"scaleY"];
}
@end
