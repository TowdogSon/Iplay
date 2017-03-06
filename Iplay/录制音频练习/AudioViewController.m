//
//  AudioViewController.m
//  Iplay
//
//  Created by 推凯 on 2017/2/16.
//  Copyright © 2017年 TK. All rights reserved.
//

#import "AudioViewController.h"

#import <AVFoundation/AVFoundation.h>
@interface AudioViewController ()<AVAudioRecorderDelegate,AVAudioSessionDelegate,AVAudioPlayerDelegate>
{
    AVAudioRecorder*recorder;
    AVAudioPlayer*player;
    AVAudioSession*session;
}
@end
//使用 avAudioRecorder 要用到 session对象,录音之前先要把它的状态设置为 active,其次重要的是 recorder初始化的时候的 settings 的配置,最后设计到录制的音频解码成 mp3格式使用到 lame第三方库
@implementation AudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpRecorder];
    
}

-(void)setUpRecorder
{
    NSString*documentPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask , YES)lastObject];
    NSString*savePath=[documentPath stringByAppendingString:@"/audioDemo.caf"];
    NSURL *saveURL=[NSURL fileURLWithPath:savePath];

    session=[AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    NSMutableDictionary*settings=[[NSMutableDictionary alloc]init];
    
    [settings setValue:[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    [settings setValue:[NSNumber numberWithFloat:4410.0] forKey:AVSampleRateKey];
    [settings setValue:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    NSError*error=nil;
    recorder =[[AVAudioRecorder alloc]initWithURL:saveURL settings:settings error:&error];
    recorder.delegate=self;
    recorder.meteringEnabled=YES;
    [recorder prepareToRecord];
    
    
}
- (IBAction)startRecord:(id)sender {
    
    UIButton*bt=sender;
    if (player.isPlaying) {
        [player stop];
    }
    if (!recorder.isRecording) {
        [session setActive:YES error:nil];
        [recorder record];
        [bt setTitle:@"停止" forState:UIControlStateNormal];
    }else
    {
        [recorder pause];
        [bt setTitle:@"开始录音" forState:UIControlStateNormal];
        [session setActive:NO error:nil];
    }
    
    
}
- (IBAction)playAudio:(id)sender {
    
    if (!recorder.isRecording) {
        player=[[AVAudioPlayer alloc]initWithContentsOfURL:recorder.url error:nil];
        NSLog(@"%@",recorder.url);
        [player setDelegate:self];
        [player play];
    }else{
        [session setActive:NO error:nil];
        [recorder stop];
        [self playAudio:nil];
    }
    
    
}

- (IBAction)getDataSize:(id)sender {
    
    
    NSData*data=[NSData dataWithContentsOfURL:recorder.url];
    
    NSInteger size=[data length];
    
   NSString*str= [NSString stringWithFormat:@"%ldkb",size/1000];
    
    //alertViewController 要在屏幕中间出现,必须是用构造方法初始化选择 style;
    
    UIAlertController*alert=[UIAlertController alertControllerWithTitle:@"文件大小" message:str  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
   
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    NSLog(@"%s",__func__);
}
@end
