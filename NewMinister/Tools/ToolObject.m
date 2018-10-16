//
//  ToolObject.m
//  NewMinister
//
//  Created by 范声乐 on 2018/9/30.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "ToolObject.h"

@implementation ToolObject


+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part Color:(UIColor *)color
{
    NSRange found = [str rangeOfString:part options:NSCaseInsensitiveSearch];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:str];
    if (found.length>0) {
        [str1 addAttribute:NSForegroundColorAttributeName value:color range:found];
    }
    return str1;
}
+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part font:(UIFont *)font
{
    NSRange found = [str rangeOfString:part options:NSCaseInsensitiveSearch];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:str];
    if (found.length>0) {
        [str1 addAttribute:NSFontAttributeName value:font range:found];
    }
    return str1;
}

+ (NSMutableAttributedString *)ChangeStr:(NSString *)str part:(NSString *)part attributes:(NSDictionary *)dic
{
    NSRange found = [str rangeOfString:part options:NSCaseInsensitiveSearch];
    NSMutableAttributedString *str1 = [[NSMutableAttributedString alloc] initWithString:str];
    if (found.length>0) {
        [str1 addAttributes:dic range:found];
    }
    return str1;
}

+ (CGSize )returnAdaptiveTextSizeWithText:(NSString *)textStr calculateWidth:(CGSize)widthSize calculateHeight:(CGSize)heightSize font:(UIFont *)font{
    
    NSDictionary *attributes = @{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor blackColor]};
    //得到文本的自适应宽度
    CGFloat textWidth = [textStr boundingRectWithSize:widthSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size.width;
    //得到文本的自适应高度
    CGFloat textHeight = [textStr boundingRectWithSize:heightSize options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size.height;
    //得到文本的自适应size
    CGSize textSize = CGSizeMake(textWidth, textHeight);
    return textSize;
}
+(BOOL)isNull:(id)object
{
    // 判断是否为空串
    if ([object isEqual:[NSNull null]]) {
        return NO;
    }
    else if ([object isKindOfClass:[NSNull class]])
    {
        return NO;
    }
    else if (object==nil){
        return NO;
    }
    return YES;
}

//得到文本宽度和高度，size
+ (CGSize)rerurnSizeOfText:(NSString *)textStr font:(UIFont *)font{
    
    NSDictionary *attributes = @{NSFontAttributeName : font};
    CGSize textSize = [textStr sizeWithAttributes:attributes];
    
    return textSize;
}

//手机号码验证
+ (BOOL)isPhoneNumber:(NSString *)number{
    
    NSString *phoneRegex1 = @"1[34578]([0-9]){9}";
    NSPredicate *phoneTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex1];
    return  [phoneTest1 evaluateWithObject:number];
}

#pragma mark -- 手机号码验证 MODIFIED BY HELENSONG
+ (BOOL)isMobileNumber:(NSString *)mobileNum{
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10 * 中国移动：China Mobile
     11 * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12 */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15 * 中国联通：China Unicom
     16 * 130,131,132,152,155,156,185,186
     17 */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20 * 中国电信：China Telecom
     21 * 133,1349,153,180,189
     22 */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25 * 大陆地区固话及小灵通
     26 * 区号：010,020,021,022,023,024,025,027,028,029
     27 * 号码：七位或八位
     28 */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma 正则匹配用户密码由6-10位数字和字母和下划线组成
+ (BOOL)checkPassword:(NSString *) password
{
    
    NSString *pattern = @"^[0-9A-Za-z_]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

#pragma 正则匹配搜索关键字过滤特殊字符
+ (BOOL)checkSearchKeyName:(NSString *)keyName{
    
    //允许字母数字中文汉字存在
    NSString *pattern = @"^[a-zA-Z0-9\u4e00-\u9fa5]+$";
    //不允许字母数字中文汉字存在
    //    NSString *pattern = @"^[^a-zA-Z0-9\u4e00-\u9fa5]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:keyName];
    return isMatch;
}

#pragma mark -- 九宫格键盘的字符➊➋➌➍➎➏➐➑➒（特殊字符）规则处理
+ (BOOL)isInputRuleAndNumber:(NSString *)str
{
    NSString *other = @"➊➋➌➍➎➏➐➑➒";
    unsigned long len = str.length;
    for(int i=0;i<len;i++)
    {
        unichar a = [str characterAtIndex:i];
        if(!((isalpha(a))
             ||(isalnum(a))
             ||((a =='_') || (a == '-'))
             ||((a >= 0x4e00 && a <= 0x9fa6))
             ||([other rangeOfString:str].location != NSNotFound)
             ))
            return NO;
    }
    return YES;
}

#pragma mark -- 获取当前时间
+ (NSString*)getCurrentTime {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    return dateTime;
}
@end
