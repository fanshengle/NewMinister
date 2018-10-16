//
//  ToolObject.h
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolObject : NSObject


//改变指定字符串的字体颜色
+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part Color:(UIColor *)color;

//改变指定字符串的字体大小
+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part font:(UIFont *)font;

//改变指定字符串的字体大小和字体颜色
+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part attributes:(NSDictionary *)dic;


//得到文本的自适应宽度和高度，size
+ (CGSize )returnAdaptiveTextSizeWithText:(NSString *)textStr calculateWidth:(CGSize)widthSize calculateHeight:(CGSize)heightSize font:(UIFont *)font;

//得到文本宽度和高度，size
+ (CGSize)rerurnSizeOfText:(NSString *)textStr font:(UIFont *)font;

//手机号码验证
+ (BOOL)isPhoneNumber:(NSString *)number;

//手机号码验证 MODIFIED BY HELENSONG
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

//pragma 正则匹配用户密码由6-10位数字和字母和下划线组成
+ (BOOL)checkPassword:(NSString *) password;

//pragma 正则匹配搜索关键字过滤特殊字符
+ (BOOL)checkSearchKeyName:(NSString *)keyName;

//九宫格键盘的字符➊➋➌➍➎➏➐➑➒（特殊字符）规则处理
+ (BOOL)isInputRuleAndNumber:(NSString *)str;

//获取当前时间
+ (NSString*)getCurrentTime;

//字符串空值判断
+(BOOL)isNull:(id)object;

@end
