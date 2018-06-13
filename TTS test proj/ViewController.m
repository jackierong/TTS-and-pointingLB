//
//  ViewController.m
//  TTS test proj
//
//  Created by Rong on 2018/4/27.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "ViewController.h"
#import "RZsoundplayer.h"
#import "HNTextView.h"

@interface ViewController ()<UITextViewDelegate>
@property (nonatomic) HNTextView *textField;
@property (nonatomic) UIButton *button;
@end

static int i;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"文字转语音测试";
    self.navigationController.navigationBar.backgroundColor = [UIColor cyanColor];
    
    _textField=[[HNTextView alloc] initWithFrame:CGRectMake(50, 100, 275, 210)];
    [_textField setFont:[UIFont systemFontOfSize:13]];
    [_textField setBackgroundColor:[UIColor lightGrayColor]];
    [_textField setDelegate:self];
    _textField.placeholder = @"请输入朗读的文字";
    [self.view addSubview:_textField];
    
    _button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    _button.frame = CGRectMake(100, 330, 175, 90);
    [_button setBackgroundColor:[UIColor cyanColor]];
    [_button setTitle:@"播放" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_button setTintColor:[UIColor yellowColor]];
    [_button addTarget:self action:@selector(startSpeak:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_button];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetSpeaker)name:@"stopSpeaking" object:nil];
}
- (void)startSpeak:(UIButton *)sender {
    
    if (![RZsoundplayer soundPlayerInstance].player.speaking && ![RZsoundplayer soundPlayerInstance].player.paused) {
        i = 0;
    }
    if (i % 2 == 0) {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        if (i > 0) {
            [[RZsoundplayer soundPlayerInstance] continueSpeaking];
        } else {
            [[RZsoundplayer soundPlayerInstance] play:_textField.text];
        }
    } else {
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [[RZsoundplayer soundPlayerInstance] pauseSpeaking];
    }
    i++;
}
- (void)textViewDidChange:(UITextView *)textView {
    i = 0;
    [[RZsoundplayer soundPlayerInstance] stopSpeaking];
    [_button setTitle:@"播放" forState:UIControlStateNormal];
}
- (void)resetSpeaker {
    i = 0;
    [[RZsoundplayer soundPlayerInstance] stopSpeaking];
    [_button setTitle:@"播放" forState:UIControlStateNormal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
