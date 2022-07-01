//
//  HeeeNoScreenShotView.m
//  HeeeNoScreenShotView-demo-OC
//
//  Created by Heee on 2021/5/18.
//  注意：这个方法仅适用于iOS13及以后的系统

#import "HeeeNoScreenShotView.h"

@interface HeeeNoScreenShotView ()
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,strong) UIView *clearView;

@end

@implementation HeeeNoScreenShotView
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
  self = [super initWithCoder:coder];
  if (self) {
    [self setupUI];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.textField.frame = self.bounds;
  self.clearView.frame = self.bounds;
}

- (void)setupUI {
  [self addSubview:self.textField];
  self.textField.subviews.firstObject.userInteractionEnabled = YES;
  [self.textField.subviews.firstObject addSubview:self.clearView];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)noti {
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
        self.textField.subviews.firstObject.userInteractionEnabled = YES;
    }
}

- (void)addSubview:(UIView *)view {
  [super addSubview:view];
  if (self.textField != view) {
    [self.clearView addSubview:view];
  }
}

- (UITextField *)textField {
  if (!_textField) {
    _textField = [[UITextField alloc] init];
    _textField.secureTextEntry = YES;
  }
  
  return _textField;
}

- (UIView *)clearView {
  if (!_clearView) {
    _clearView = [[UIView alloc] init];
    _clearView.backgroundColor = [UIColor clearColor];
  }
  
  return _clearView;
}

@end
