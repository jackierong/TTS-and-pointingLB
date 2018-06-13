//
//  RZsoundplayer.h
//  TTS test proj
//
//  Created by Rong on 2018/4/27.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface RZsoundplayer : NSObject {
    NSMutableDictionary *soundSet;  //声音设置
    NSString *path;  //配置文件路径
}

@property(nonatomic,assign)float rate;   //语速
@property(nonatomic,assign)float volume; //音量
@property(nonatomic,assign)float pitchMultiplier;  //音调
@property(nonatomic,assign)BOOL autoPlay;  //自动播放
@property (nonatomic) AVSpeechSynthesizer *player;

+(RZsoundplayer *)soundPlayerInstance;

-(void)play:(NSString *)text;//播放

-(void)pauseSpeaking;//暂停播放

-(void)continueSpeaking;//继续播放

-(void)stopSpeaking;//停止播放

-(void)setDefault;//恢复默认设置

-(void)writeSoundSet;

@end
