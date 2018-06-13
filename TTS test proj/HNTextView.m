//
//  HNTextView.m
//  witcontact
//
//  Created by songtao on 16/12/27.
//
//

#import "HNTextView.h"
#import <UIKit/UILabel.h>
#import <UIKit/UINibLoading.h>

@interface HNTextView ()

-(void)refreshPlaceholder;

@end

@implementation HNTextView {
    UILabel *placeHolderLabel;
}

@synthesize placeholder = _placeholder;

-(void)initialize {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshPlaceholder) name:UITextViewTextDidChangeNotification object:self];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

-(void)refreshPlaceholder{
    if([[self text] length]) {
        [placeHolderLabel setAlpha:0];
    }else{
        [placeHolderLabel setAlpha:1];
    }
    placeHolderLabel.textColor = [UIColor blueColor];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    [self refreshPlaceholder];
}

-(void)setFont:(UIFont *)font {
    [super setFont:font];
    placeHolderLabel.font = self.font;
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [placeHolderLabel sizeToFit];
    placeHolderLabel.frame = CGRectMake(6, 0, self.frame.size.width, 100);//M, M, CGRectGetWidth(self.frame)-M*2, CGRectGetHeight(placeHolderLabel.frame)
}

-(void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    
    if (placeHolderLabel == nil) {
        placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
        placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.font = self.font;
        placeHolderLabel.backgroundColor = [UIColor clearColor];
        placeHolderLabel.textColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        placeHolderLabel.alpha = 0;
        [self addSubview:placeHolderLabel];
    }
    
    placeHolderLabel.text = self.placeholder;
    [self refreshPlaceholder];
}

//When any text changes on textField, the delegate getter is called. At this time we refresh the textView's placeholder
-(id<UITextViewDelegate>)delegate {
    [self refreshPlaceholder];
    return [super delegate];
}

@end
