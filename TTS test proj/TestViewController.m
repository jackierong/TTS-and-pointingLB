//
//  TestViewController.m
//  HorizenSelectView
//
//  Created by Rong on 2017/8/25.
//  Copyright © 2017年 Rong. All rights reserved.
//

#import "TestViewController.h"
#import "WBPopOverView.h"
#import "IWCommon.h"

@interface TestViewController ()

@property (nonatomic, strong) UILabel *xzLb, *sxLb;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.title = @"测试";
    self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];
    
    self.xzLb = [[UILabel alloc] initWithFrame:CGRectMake(0, CH * 2 / 9 + 20, CW / 2, CH / 9)];
    self.sxLb = [[UILabel alloc] initWithFrame:CGRectMake(CW / 2, CH * 2 / 9 + 20, CW / 2, CH / 9)];
    [self.xzLb setBackgroundColor:[UIColor blueColor]];
    [self.sxLb setBackgroundColor:[UIColor blueColor]];
    [self.xzLb setTextAlignment:NSTextAlignmentCenter];
    [self.sxLb setTextAlignment:NSTextAlignmentCenter];
    [self.sxLb setText:@"生肖"];
    [self.xzLb setText:@"星座"];
    [self.xzLb.layer setBorderWidth:0.5];
    [self.sxLb.layer setBorderWidth:0.5];
    [self.view addSubview:self.xzLb];
    [self.view addSubview:self.sxLb];
    
    CGPoint point=CGPointMake(self.xzLb.frame.origin.x+self.xzLb.frame.size.width/2, self.xzLb.frame.origin.y+self.xzLb.frame.size.height);//箭头点的位置
    WBPopOverView *view=[[WBPopOverView alloc]initWithOrigin:point Width:160 Height:100 Direction:WBArrowDirectionUp1 color:[UIColor colorWithWhite:0.2 alpha:1]];//初始化弹出视图的箭头顶点位置point，展示视图的宽度Width，高度Height，Direction以及展示的方向
    UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 160, 100)];
    lable.text=@"这里显示星座";
    lable.textColor=[UIColor whiteColor];
    [view.backView addSubview:lable];
    [self.view addSubview:view];
    CGPoint point1=CGPointMake(self.xzLb.frame.origin.x+self.xzLb.frame.size.width/2, self.xzLb.frame.origin.y);//箭头点的位置
    WBPopOverView *view1=[[WBPopOverView alloc]initWithOrigin:point1 Width:160 Height:100 Direction:WBArrowDirectionDown3 color:[UIColor purpleColor]];//初始化弹出视图的箭头顶点位置point，展示视图的宽度Width，高度Height，Direction以及展示的方向
    UILabel *lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 160, 100)];
    lable1.text=@"这里显示星座";
    lable1.textColor=[UIColor whiteColor];
    [view1.backView addSubview:lable1];
    [self.view addSubview:view1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
