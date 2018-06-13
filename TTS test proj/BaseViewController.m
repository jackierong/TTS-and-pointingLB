//
//  BaseViewController.m
//  TTS test proj
//
//  Created by Rong on 2018/6/13.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "BaseViewController.h"
#import "TestViewController.h"
#import "ViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"测试测试";
    self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];
    
    UIButton *arrowLbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    arrowLbBtn.backgroundColor = [UIColor lightGrayColor];
    [arrowLbBtn setTitle:@"指向箭头测试" forState:(UIControlStateNormal)];
    [arrowLbBtn setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    [arrowLbBtn addTarget:self action:@selector(pushToArrowLbtestVC:) forControlEvents:UIControlEventTouchUpInside];
    arrowLbBtn.frame = CGRectMake(CW/2 - 80, 150, 160, 80);
    [self.view addSubview:arrowLbBtn];
    
    UIButton *TTFBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    TTFBtn.backgroundColor = [UIColor lightGrayColor];
    [TTFBtn setTitle:@"文字转语音测试" forState:(UIControlStateNormal)];
    [TTFBtn addTarget:self action:@selector(pushToTTFtestVC:) forControlEvents:UIControlEventTouchUpInside];
    [TTFBtn setTitleColor:[UIColor yellowColor] forState:(UIControlStateNormal)];
    TTFBtn.frame = CGRectMake(CW/2 - 80, 270, 160, 80);
    [self.view addSubview:TTFBtn];
}
//文字转语音测试跳转
- (void)pushToTTFtestVC:(UIButton *)sender {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}
//指向箭头测试跳转
- (void)pushToArrowLbtestVC:(UIButton *)sender {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
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
