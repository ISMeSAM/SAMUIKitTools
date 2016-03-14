//
//  UILabel+SAMExtension.m

#import "UILabel+SAMExtension.h"

@implementation UILabel (SAMExtension)

- (NSRange)rangeWithText:(NSString *)text
{
    if ([self.text length] <= 0 ||
        [text length] <= 0)
    {
        return NSMakeRange(0, 0);
    }
    else
    {
        NSRange range = [self.text rangeOfString:text];
        return range;
    }
}

-(NSInteger)getAutoHeight{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.font, NSFontAttributeName, nil];
    NSAttributedString *attr=[[NSAttributedString alloc] initWithString:self.text attributes:attributesDictionary];
    CGRect frame =  [attr boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame),MAXFLOAT)
                                       options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                       context:nil];
    return round(frame.size.height+0.5);
}

-(void)setColor:(UIColor *)_color font:(UIFont*)_font{
    self.textColor=_color;
    self.font=_font;
}

- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color{
    [self setAttributedText:_text withColor:_color fontSize:0];
}

- (void)setAttributedText:(NSString*)_text fontSize:(NSInteger)_fontSize{
    [self setAttributedText:_text withColor:nil fontSize:_fontSize];
}

- (void)setAttributedText:(NSString*)_text font:(UIFont*)_font{
    [self setAttributedText:_text withColor:nil font:_font];
}

- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color fontSize:(NSInteger)_fontSize
{
    if (self.text.length>0||self.attributedText.length>0) {
        NSMutableAttributedString *attStr=nil;
        if (self.attributedText.length>0) {
            attStr=[self.attributedText mutableCopy];
        }else{
            if (self.text.length>0) {
                attStr = [[NSMutableAttributedString alloc] initWithString:self.text];
            }
        }
        if (_color && _text) {
            [attStr addAttribute:NSForegroundColorAttributeName value:_color range:[self rangeWithText:_text]];
        }
        if (_fontSize>0 && _text){
            [attStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:self.font.fontName size:_fontSize] range:[self rangeWithText:_text]];
        }
        self.attributedText = attStr;
        [self setNeedsDisplay];
    }
}

- (void)setAttributedText:(NSString*)_text withColor:(UIColor *)_color font:(UIFont*)_font
{
    if (self.text.length>0||self.attributedText.length>0) {
        NSMutableAttributedString *attStr=nil;
        if (self.attributedText.length>0) {
            attStr=[self.attributedText mutableCopy];
        }else{
            if (self.text.length>0) {
                attStr = [[NSMutableAttributedString alloc] initWithString:self.text];
            }
        }
        if (_color && _text) {
            [attStr addAttribute:NSForegroundColorAttributeName value:_color range:[self rangeWithText:_text]];
        }
        if (_font && _text){
            [attStr addAttribute:NSFontAttributeName value:_font range:[self rangeWithText:_text]];
        }
        self.attributedText = attStr;
        [self setNeedsDisplay];
    }
}



@end




