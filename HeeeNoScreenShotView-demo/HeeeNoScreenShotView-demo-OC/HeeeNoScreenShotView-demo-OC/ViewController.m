//
//  ViewController.m
//  HeeeNoScreenShotView-demo-OC
//
//  Created by Heee on 2021/5/18.
//

#import "ViewController.h"
#import "HeeeNoScreenShotView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  if (@available(iOS 13.0, *)) {
    HeeeNoScreenShotView *noScreenShotView = [[HeeeNoScreenShotView alloc] initWithFrame:CGRectMake(50, 50, 240, 200)];
    noScreenShotView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    [self.view addSubview:noScreenShotView];
    
    UIButton *privacyBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 100, 40)];
    privacyBtn.backgroundColor = [UIColor systemRedColor];
    [privacyBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    privacyBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [privacyBtn setTitle:@"隐私按钮" forState:(UIControlStateNormal)];
    [privacyBtn addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    [noScreenShotView addSubview:privacyBtn];
    
    UILabel *privacyLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 30, 100, 40)];
    privacyLabel.textAlignment = NSTextAlignmentCenter;
    privacyLabel.backgroundColor = [UIColor systemGreenColor];
    privacyLabel.font = [UIFont systemFontOfSize:15];
    privacyLabel.text = @"隐私文字";
    [noScreenShotView addSubview:privacyLabel];
  }
}

- (void)click {
  NSLog(@"点击了按钮");
}

@end
