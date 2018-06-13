//
//  RZsoundplayer.m
//  TTS test proj
//
//  Created by Rong on 2018/4/27.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "RZsoundplayer.h"

static RZsoundplayer *soundplayer = nil;
@interface RZsoundplayer()

@end

@implementation RZsoundplayer

+(RZsoundplayer *)soundPlayerInstance {
    if(soundplayer == nil) {
        soundplayer=[[RZsoundplayer alloc]init];
        [soundplayer initSoundSet];
    }
    return soundplayer;
}
//初始化配置
-(void)initSoundSet {
//    path=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"SoundSet.plist"];
//    soundSet=[NSMutableDictionary dictionaryWithContentsOfFile:path];
//    if(soundSet==nil) {
//        soundSet=[NSMutableDictionary dictionary];
        [soundplayer setDefault];
//        [soundplayer writeSoundSet];
//    } else {
//        self.autoPlay=[[soundSet valueForKeyPath:@"autoPlay"] boolValue];
//        self.volume=[[soundSet valueForKeyPath:@"volume"] floatValue];
//        self.rate=[[soundSet valueForKeyPath:@"rate"] floatValue];
//        self.pitchMultiplier=[[soundSet valueForKeyPath:@"pitchMultiplier"] floatValue];
//    }
    if (_player == nil) {
        _player=[[AVSpeechSynthesizer alloc]init];
    }
}
//播放声音
-(void)play:(NSString*)text {
    if(text) {
        AVSpeechUtterance *u=[[AVSpeechUtterance alloc]initWithString:text];//设置要朗读的字符串
        if ([self hasChinese:text]) {
            u.voice=[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
        } else {
            u.voice=[AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];//设置语言 en-GB zh-CN
        }
        u.volume=self.volume;  //设置音量（0.0~1.0）默认为1.0
        u.rate=self.rate;  //设置语速
        u.pitchMultiplier=self.pitchMultiplier;//设置语调
        [_player speakUtterance:u];
    }
}
//AVSpeechSynthesizer控制: continueSpeaking(继续说), pauseSpeakingAtBoundary(暂停说话), paused(暂停状态的属性), speaking(说话的状态), stopSpeakingAtBoundary(停止说话)
//暂停播放
-(void)pauseSpeaking {
    [_player pauseSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}
//继续播放
-(void)continueSpeaking {
    [_player continueSpeaking];
}
//停止播放
-(void)stopSpeaking {
    [_player stopSpeakingAtBoundary:AVSpeechBoundaryWord];
}
//判断阅读的内容是否包含中文
- (BOOL)hasChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff) {
            return YES;
        }
    }
    return NO;
}
//恢复默认设置
-(void)setDefault {
    self.volume=1.0;
    self.rate=0.45;
    self.pitchMultiplier=0.8;
}
//将设置写入配置文件
-(void)writeSoundSet {
    [soundSet setValue:[NSNumber numberWithBool:self.autoPlay] forKey:@"autoPlay"];
    [soundSet setValue:[NSNumber numberWithFloat:self.volume] forKey:@"volume"];
    [soundSet setValue:[NSNumber numberWithFloat:self.rate] forKey:@"rate"];
    [soundSet setValue:[NSNumber numberWithFloat:self.pitchMultiplier] forKey:@"pitchMultiplier"];
    [soundSet writeToFile:path atomically:YES];
}

@end
