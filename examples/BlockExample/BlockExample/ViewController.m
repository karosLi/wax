//
//  ViewController.m
//  BlockExample
//
//  Created by junzhan on 15/12/29.
//  Copyright © 2015年 test.jz.com. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>

typedef struct _XPoint
{
    int x;
    int y;
}XPoint;


@interface ViewController ()
{
    NSInteger _aInteger;
    CGFloat _aCGFloat;
}
@property (nonatomic) XPoint vP;
@property (nonatomic) CGRect vRect;
@end

@implementation ViewController

- (XPoint)argInXPoint:(XPoint)vXPoint
{
    return vXPoint;
}

- (CGRect)argInRect:(CGRect)vRect
{
    return vRect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    XPoint xp;
    xp.x = 3;
    xp.y = 4;
    XPoint p = [self argInXPoint:xp];
    
    CGRect xrect;
    xrect.origin.x = 3.0;
    xrect.origin.y = 4.0;
    xrect.size.width = 5.0;
    xrect.size.height = 6.0;
    CGRect rect = [self argInRect:xrect];
    
    // Do any additional setup after loading the view, typically from a nib.
    _aInteger = 1234;
    _aCGFloat = 456;
    [self setMyView];
    NSLog(@"_aInteger=%ld _aCGFloat=%f", (long)_aInteger, _aCGFloat);
}

- (void)setMyView {
//    UIView *view = [UIView new];
//    [self.view addSubview:view];
//    view.backgroundColor = [UIColor greenColor];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.offset(50);
//        make.height.offset(50);
//    }];
}


- (void)setMyView2
{
    UIView *view = [UIView new];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor greenColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(200);
        make.left.equalTo(self.view).offset(50);
        make.width.offset(10);
        make.height.offset(10);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
