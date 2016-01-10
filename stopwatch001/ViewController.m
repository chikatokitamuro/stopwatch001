//
//  ViewController.m
//  stopwatch001
//
//  Created by chikatokitamuro on 2016/01/11.
//  Copyright © 2016年 chikatokitamuro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // 時刻を表示するためのラベルインスタンスを格納するための変数
    UILabel *timeLabel;
    
    // 背景画像を表示するためのイメージビューインスタンスを格納するための変数
    UIImageView *backgroundView;
    UIButton *aButton;
    UIButton *rButton;
    UIButton *sButton;
    
    //タイマーを格納する変数を宣言
    NSTimer *atimer;
    NSInteger countNumber;
}
@end

@implementation ViewController



- (void)setupParts{
    // 背景画像を設定
    backgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 280)];
    // 画像を設定
    backgroundView.image = [UIImage imageNamed:@"bonb1.png"];
    // イメージビューを画面に貼付ける
    [self.view addSubview:backgroundView];
    // ラベルを作成
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    // ラベルの位置を中心で設定
    timeLabel.center = CGPointMake(160, 350);
    // ラベルに表示するフォントと文字サイズの設定
    timeLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:48];
    // ラベルに表示する文字を設定
    timeLabel.text = @"00:00";
    timeLabel.textColor = [UIColor redColor];
    // ラベルの文字寄せを設定
    timeLabel.textAlignment = NSTextAlignmentCenter;
    // ラベルの背景色を透明に設定
    timeLabel.backgroundColor = [UIColor clearColor];
    // ラベルを画面に貼付ける
    [self.view addSubview:timeLabel];
    
    //スタートボタン　ストップボタン　リセットボタン　を作る
    aButton = [UIButton buttonWithType:UIButtonTypeSystem];
    aButton.frame = CGRectMake(30, 200, 100, 50);
    aButton.center = CGPointMake(100, 450);
    aButton.tintColor = [UIColor redColor];
    aButton.backgroundColor = [UIColor greenColor];
    [aButton setTitle:@"スタート" forState:UIControlStateNormal];
    [self.view addSubview:aButton];
    
    sButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sButton.frame = CGRectMake(30, 200, 100, 50);
    sButton.center = CGPointMake(100, 450);
    sButton.tintColor = [UIColor redColor];
    sButton.backgroundColor = [UIColor greenColor];
    [sButton setTitle:@"ストップ" forState:UIControlStateNormal];
    
    
    rButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rButton.frame = CGRectMake(100, 200, 100, 50);
    rButton.center = CGPointMake(200, 450);
    rButton.tintColor = [UIColor greenColor];
    rButton.backgroundColor = [UIColor redColor];
    [rButton setTitle:@"リセット" forState:UIControlStateNormal];
    [self.view addSubview:rButton];
    
}


-(void)timerStop:(id)sender{
    if (atimer != nil){
        [atimer invalidate];
        atimer = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // ラベルとイメージビューを作成するメソッドを呼び出す
    [self setupParts];
    
    
    countNumber = 0;
    
    //タイマーインスタンスを作成
    atimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES];
    
    
}
-(void)tick:(NSTimer*)timer{
    NSLog(@"タイマー呼び出し");
    //slackの解説で　呼び出し先でラベルの内容を変更する処理を書けば、タイマーがメソッドを呼び出すたびにラベルの表示が更新されるようになります。
    //と説明を受けましたが意味がわかりません
    
    
    //同じようにtimeLabelにtimer変数を表示させる
    countNumber++;
    [timeLabel setText:@"00:00"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
