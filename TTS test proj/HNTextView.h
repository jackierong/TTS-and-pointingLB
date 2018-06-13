//
//  HNTextView.h
//  witcontact
//
//  Created by songtao on 16/12/27.
//
//

#import <UIKit/UIKit.h>

@interface HNTextView : UITextView

/**
 Set textView's placeholder text. Default is nil.
 */
@property(nullable, nonatomic,copy) IBInspectable NSString *placeholder;

@end
