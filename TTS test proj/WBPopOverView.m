//
//  WBPopOverView.m
//  pop_test
//
//  Created by tuhui－03 on 16/5/19.
//  Copyright © 2016年 tuhui－03. All rights reserved.
//

#import "WBPopOverView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface WBPopOverView ()

@property (nonatomic, assign) CGRect currentFrame;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) WBArrowDirection direction;

@end

@implementation WBPopOverView

- (instancetype)initWithSuperView:(UIView *)superView Origin:(CGPoint)origin Width:(CGFloat)width Height:(float)height Direction:(WBArrowDirection)direction color:(UIColor *)color {
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)]) {
        //背景颜色为无色
        self.backgroundColor=[UIColor clearColor];
        //定义显示视图的参数
        self.origin = origin;
        self.height = height;
        self.width = width;
        self.direction = direction;
        self.backView=[[UIView alloc]initWithFrame:CGRectMake(origin.x, origin.y, width, height)];
        _currentFrame = self.backView.frame;
        self.backView.layer.cornerRadius = 8;
        self.backView.backgroundColor = color;
        UITapGestureRecognizer *hidden = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView:)];
        [self.backView addGestureRecognizer:hidden];
        [superView addSubview:self.backView];
   
    }
    return self;
}
//绘制箭头
- (void)drawRect:(CGRect)rect {
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGFloat startX = self.origin.x - 20;
    CGFloat startY = self.origin.y;
    CGFloat arrowH = 20;
    if (_direction==WBArrowDirectionLeft1) {

        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-20, self.width,self. height);
    } else if (_direction==WBArrowDirectionLeft2) {

        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height/2, self.width,self. height);
    } else if (_direction==WBArrowDirectionLeft3) {

        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX+5, startY-5);
        CGContextAddLineToPoint(context, startX+5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x+5, self.origin.y-self.height+20, self.width,self. height);
    } else if (_direction==WBArrowDirectionRight1) {
        
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-20, -self.width,self. height);
    } else if (_direction==WBArrowDirectionRight2) {
        
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height/2, -self.width,self. height);
    } else if (_direction==WBArrowDirectionRight3) {
        
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX-5, startY-5);
        CGContextAddLineToPoint(context, startX-5, startY+5);
        self.backView.frame = CGRectMake(self.origin.x-5, self.origin.y-self.height+20, -self.width,self. height);
    } else if (_direction==WBArrowDirectionUp1) {
        
        CGContextMoveToPoint(context, startX - 30, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 30, startY + arrowH);
        CGContextAddLineToPoint(context, startX, startY + arrowH);
        self.backView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y+arrowH, self.width,self. height);
    } else if (_direction==WBArrowDirectionUp2) {
        
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 15, startY + arrowH);
        CGContextAddLineToPoint(context, startX - 15, startY + arrowH);
        self.backView.frame = CGRectMake(self.origin.x-80, self.origin.y+arrowH, self.width,self. height);
    } else if (_direction==WBArrowDirectionUp3) {
        
        CGContextMoveToPoint(context, startX + 30, startY);//设置起点
        CGContextAddLineToPoint(context, startX, startY + arrowH);
        CGContextAddLineToPoint(context, startX + 30, startY + arrowH);
        self.backView.frame = CGRectMake(self.origin.x+80, self.origin.y+arrowH, -self.width,self.height);
    } else if (_direction==WBArrowDirectionDown1) {
        
        CGContextMoveToPoint(context, startX - 30, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 30, startY - arrowH);
        CGContextAddLineToPoint(context, startX, startY - arrowH);
        self.backView.frame = CGRectMake(startX - 50, self.origin.y-arrowH, self.width,-self. height);
    } else if (_direction==WBArrowDirectionDown2) {
        
        CGContextMoveToPoint(context, startX, startY);//设置起点
        CGContextAddLineToPoint(context, startX - 15, startY -arrowH);
        CGContextAddLineToPoint(context, startX + 15, startY-arrowH);
        self.backView.frame = CGRectMake(self.origin.x-self.width/2, self.origin.y-arrowH, self.width,-self. height);
    } else if (_direction==WBArrowDirectionDown3) {
        
        CGContextMoveToPoint(context, startX + 60, startY);//设置起点
        CGContextAddLineToPoint(context, startX + 30, startY - arrowH);
        CGContextAddLineToPoint(context, startX + 60, startY - arrowH);
        self.backView.frame = CGRectMake(startX - 50, self.origin.y-arrowH, self.width,-self. height);
    }
   
    CGContextClosePath(context);
    [self.backView.backgroundColor setFill];
    [self.backgroundColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    if (![touch.view isEqual:self.backView]) {
//        [self dismiss];
//    }
//}
- (void)hiddenView:(UITapGestureRecognizer *)tap {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
        self.backView.frame = CGRectMake(self.origin.x, self.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

@end
