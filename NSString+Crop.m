//
//  NSString+Crop.m
//  ScrollHero
//
//  Created by 韩卫星 on 2020/8/11.
//  Copyright © 2020 Percent. All rights reserved.
//

#import "NSString+Crop.h"
#import <CoreText/CoreText.h>

@implementation NSString (Crop)

+ (NSString *)getSubstringInFixedWidth:(NSString *)string font:(UIFont*)font attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs fixedWidth:(CGFloat)width {
    NSAttributedString *finalAtt = [[NSAttributedString alloc] initWithString:string attributes:attrs];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)finalAtt);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, width, font.lineHeight)];
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, string.length), path.CGPath, NULL);
    CFRange range = CTFrameGetVisibleStringRange(frame);
    CFRelease(framesetter);
    CFRelease(frame);
    return [string substringWithRange:NSMakeRange(range.location, range.length)];
}

+ (NSArray <NSString *> *)getSeparatedLinesWithText:(NSString *)string font:(UIFont *)font attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs fixedWidth:(CGFloat)width {
//    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string attributes:attrs];
//    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, width, 100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [string substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;

}

@end
