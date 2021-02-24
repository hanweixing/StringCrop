//
//  NSString+Crop.h
//  ScrollHero
//
//  Created by 韩卫星 on 2020/8/11.
//  Copyright © 2020 Percent. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Crop)

/// 对于一个完整的字符串，获取在固定宽度内的子字符串.
/// @param string 完整的字符串
/// @param font 字符串展示出来的字体
/// @param attrs 字符串展示出来的富文本属性集合
/// @param width 固定的宽度
+ (NSString *)getSubstringInFixedWidth:(NSString *)string font:(UIFont*)font attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs fixedWidth:(CGFloat)width;

/// 将一个字符串，放在固定的宽度中，得到每一行的字符串数组.
/// @param string 完整的字符串
/// @param font 字符串展示出来的字体
/// @param attrs 字符串展示出来的富文本属性集合
/// @param width 固定的宽度
+ (NSArray <NSString *> *)getSeparatedLinesWithText:(NSString *)string font:(UIFont *)font attributes:(nullable NSDictionary<NSAttributedStringKey, id> *)attrs fixedWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
