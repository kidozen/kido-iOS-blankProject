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

#warning REPLACE DEFINITIONS WITH YOUR ACCOUNT PARAMETERS.

#define KidoZenAppCenterUrl @"https:????.kidocloud.com"
#define KidoZenAppName @"???"
#define KidoZenProvider @"Kidozen"
#define KidoZenUser @"user@email.com"
#define KidoZenPassword @"????"
@interface KZBlankSampleViewController () <KZConnectionManagerDelegate>

@property (nonatomic,strong) KZConnectionManager *kidoZenConector;
@property (nonatomic,strong) UILabel *helloKidoLabel;
@property (nonatomic, strong) KZResponse *kzResponse;

@end

@implementation KZBlankSampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _kidoZenConector = [[KZConnectionManager alloc]initWithAppCenterUrl:KidoZenAppCenterUrl andAppName:KidoZenAppName];
    _kidoZenConector.delegate = self;
    
    _helloKidoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 260, self.view.bounds.size.width, 50)];
    [_helloKidoLabel setText:@"Hello Kido"];
    [_helloKidoLabel setTextColor:[UIColor blackColor]];
    [_helloKidoLabel setTextAlignment:NSTextAlignmentCenter];
    [_helloKidoLabel setNumberOfLines:2];
    [self.view addSubview:_helloKidoLabel];
}

- (void)conectionSuccessfulWithResponse:(KZResponse *)response{
    
    self.kzResponse = response;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(authenticateUser)forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Authenticate" forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0.0, 120.0, self.view.bounds.size.width, 40.0)];
    [self.view addSubview:button];
}

- (void)authenticateUser{
    
    UIActivityIndicatorView * waitingGear = [[UIActivityIndicatorView alloc]initWithFrame:self.view.bounds];
    [waitingGear startAnimating];
    [waitingGear setBackgroundColor:[UIColor colorWithWhite:0 alpha:.7]];
    [self.view addSubview:waitingGear];

     [_kzResponse.application authenticateUser:KidoZenUser withProvider:KidoZenProvider andPassword:KidoZenPassword completion:^(id c) {
        if (c) {
            
            [_helloKidoLabel setText:[NSString stringWithFormat:@"Hello: %@ \n You are logged in!",KidoZenUser]];
            [waitingGear stopAnimating];
            [waitingGear removeFromSuperview];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
