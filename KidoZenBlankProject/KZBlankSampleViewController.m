//
//  KZBlankSampleViewController.m
//  KidoZenBlankProject
//
//  Created by KidoZen Inc on 7/1/14.
//  Copyright (c) 2014 KidoZen. All rights reserved.
//

#import "KZBlankSampleViewController.h"
#import "KZConnectionManager.h"
#import "KZResponse.h"

#warning Replace definitions with your account parameters:
#define KidoZenProvider @"Kidozen"
#define KidoZenUser @"demo@kidozen.com"
#define KidoZenPassword @"pass"

@interface KZBlankSampleViewController () <KZConnectionManagerDelegate>

@property (nonatomic,strong) KZConnectionManager *kidoZenConector;
@property (nonatomic,strong) UILabel *helloKidoLabel;
@property (nonatomic, strong) KZResponse *kzResponse;

@end

@implementation KZBlankSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _kidoZenConector = [[KZConnectionManager alloc]init];
    _kidoZenConector.delegate = self;
    
    _helloKidoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 260, self.view.bounds.size.width, 30)];
    [_helloKidoLabel setText:@"Hello Kido"];
    [_helloKidoLabel setTextColor:[UIColor blackColor]];
    [_helloKidoLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_helloKidoLabel];
}

- (void)conectionSuccessfulWithResponse:(KZResponse *)response{
    
    self.kzResponse = response;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(authenticateUser)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Authenticate" forState:UIControlStateNormal];
    button.frame = CGRectMake(0.0, 120.0, self.view.bounds.size.width, 40.0);
    [self.view addSubview:button];
}

- (void)authenticateUser{
    

     [_kzResponse.application authenticateUser:KidoZenUser withProvider:KidoZenProvider andPassword:KidoZenPassword completion:^(id c) {
        if (c) {
            [_helloKidoLabel setText:[NSString stringWithFormat:@"Hello:%@",KidoZenUser]];

        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
