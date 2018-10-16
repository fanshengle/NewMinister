//
//  NMNewAddressViewController.m
//  NewMinister
//
//  Created by Andy on 2018/10/15.
//  Copyright © 2018年 范声乐. All rights reserved.
//

#import "NMNewAddressViewController.h"
#import "NMAddressSetViewController.h"
#import "NMStudent.h"
#import "NMStudentFMDNManager.h"
#import "ToolObject.h"
#import "DQAreasView.h"
#import "DQAreasModel.h"
#import "NMPersonalDataViewController.h"

@interface NMNewAddressViewController ()
<DQAreasViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *addressTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic, strong) DQAreasView *areasView;//所在地
@property (nonatomic,strong) UILabel *addressLabel;

@end

@implementation NMNewAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultNavTitle:@"新建地址"];
    self.navBarView.navBackgroundColor=[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self setBut];
    [self setUI];
}

-(void)setUI{
    
    UIView * bgview =[[UIView alloc]initWithFrame:CGRectMake(0, NMNavbarHeight, NMScreenWidth, 197)];
    bgview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgview];

    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, NMScreenWidth, 5)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"car_addressBack"]];
    [bgview addSubview:view];
    
     _addressLabel = [[UILabel alloc] init];
    _addressLabel.frame = CGRectMake(16,26,NMScreenWidth-40,12.5);
    _addressLabel.text = @"省会、城市、区县";
    _addressLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    _addressLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [bgview addSubview:_addressLabel];
    
    UIImageView * imageview =[[UIImageView alloc]initWithFrame:CGRectMake(NMScreenWidth-26, CGRectGetMaxY(view.frame)+19, 6, 10)];
    imageview.image=[UIImage imageNamed:@"car_ArrowGray"];
    [bgview addSubview:imageview];
    

    UIView * xaview = [[UIView alloc] init];
    xaview.frame = CGRectMake(15,CGRectGetMaxY(_addressLabel.frame)+15,NMScreenWidth-30,1);
    xaview.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [bgview addSubview:xaview];
    
    
    _addressTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(xaview.frame), NMScreenWidth-30, 48)];
    _addressTextField.placeholder = @"详细地址、如街道、楼牌号等";
    _addressTextField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    _addressTextField.font = [UIFont systemFontOfSize:13];
    _addressTextField.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    _addressTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [bgview addSubview:_addressTextField];

    
    UIView * xbview = [[UIView alloc] init];
    xbview.frame = CGRectMake(15,CGRectGetMaxY(_addressTextField.frame),NMScreenWidth-30,1);
    xbview.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [bgview addSubview:xbview];
    

    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(xbview.frame), NMScreenWidth-30, 48)];
    _nameTextField.placeholder = @"姓名";
    _nameTextField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    _nameTextField.font = [UIFont systemFontOfSize:13];
    _nameTextField.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    _nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [bgview addSubview:_nameTextField];
    
    UIView * xcview = [[UIView alloc] init];
    xcview.frame = CGRectMake(15,CGRectGetMaxY(_nameTextField.frame),NMScreenWidth-30,1);
    xcview.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    [bgview addSubview:xcview];


    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(xcview.frame), NMScreenWidth-30, 48)];
    _phoneTextField.placeholder = @"手机号码";
    _phoneTextField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    _phoneTextField.font = [UIFont systemFontOfSize:13];
    _phoneTextField.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    _phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    [bgview addSubview:_phoneTextField];

    UIView  * butView =[[UIView alloc]initWithFrame:CGRectMake(0, 5, NMScreenWidth, 48)];
    [bgview addSubview:butView];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(butViewAction:)];
    [butView addGestureRecognizer:tapGesturRecognizer];


}
-(void)setBut{
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,NMScreenHeight-49,NMScreenWidth,49);
    view.backgroundColor = [UIColor clearColor];
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,NMScreenHeight-49,NMScreenWidth,49);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:83/255.0 blue:73/255.0 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:244/255.0 green:57/255.0 blue:46/255.0 alpha:1].CGColor];
    gl.locations = @[@(0.0),@(1.0)];
    [self.view.layer addSublayer:gl];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0,NMScreenHeight-30,NMScreenWidth,13);
    label.text = @"保存收货信息";
    label.textAlignment=NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"PingFang-SC-Bold" size:14];
    label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:label];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [view addGestureRecognizer:tapGesturRecognizer];
    
}
-(void)butViewAction:(id)tap
{
    self.areasView = [DQAreasView new];
    self.areasView.delegate = self;
    [self.areasView startAnimationFunction];

}
-(void)tapAction:(id)tap
{
    if ([_addressLabel.text isEqualToString:@""]) {
        return;
    }
    if ([_nameTextField.text isEqualToString:@""]) {
        return;
    }
    if ([_phoneTextField.text isEqualToString:@""]) {
        return;
    }
    NSString * str=[NSString stringWithFormat:@"%@%@",_addressLabel.text,_addressTextField.text];
    
    NMAddressSetViewController*power= [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    NMStudent *stu = [NMStudent studentWith:str name:_nameTextField.text sex:_phoneTextField.text];
    BOOL isInsert = [NMStudentFMDNManager addStudent:stu];
    NSArray *arr = [NMStudentFMDNManager queryStudent:nil];
    [power.dataArr removeAllObjects];
    [power.dataArr addObjectsFromArray:arr];

    if (isInsert) {
        [self.navigationController popToViewController:power animated:YES];
    } else {
        NSLog(@"插入失败");
    }

}
//点击选中哪一行 的代理方法
- (void)clickAreasViewEnsureBtnActionAreasDate:(DQAreasModel *)model{
    
    _addressLabel.text =[NSString stringWithFormat:@"%@%@%@",model.Province,model.city,model.county];
}

@end
