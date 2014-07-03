//
//  KidoZenConnectionManager.m
//  KidoZenBlankProject
//
//  Created by KidoZen Inc on 6/30/14.
//  Copyright (c) 2014 KidoZen. All rights reserved.
//

#import "KZConnectionManager.h"
#import "KZResponse.h"
#import "KZApplication.h"

#define KidoZenAppCenterUrl @"https://kidodemo.kidocloud.com"
#define KidoZenAppName @"tasks"

@interface KZConnectionManager ()

@property (nonatomic,strong) KZApplication *kzApp;

@end


@implementation KZConnectionManager
@synthesize delegate;

//+ (id)sharedConnectionManager
//{
//    static KZConnectionManager *sharedConnectionManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedConnectionManager = [[self alloc] init];
//        });
//    
//    return sharedConnectionManager;
//}

- (id)init
{
    if (self = [super init]) {
        [self connectToKidoZenServices];
    }
    
    return self;
}

- (void)connectToKidoZenServices
{
    self.kzApp = [[KZApplication alloc] initWithTennantMarketPlace:KidoZenAppCenterUrl
                                                   applicationName:KidoZenAppName
                                                    applicationKey:nil
                                                         strictSSL:NO
                                                       andCallback:^(KZResponse * response) {
                                                           if (response.response!=nil) {
//                                                               self.kzResponse = response;
                                                               [self conectionSuccessfulWithResponse:response];
                                                           }else {
                                                               NSLog(@"**** ERROR MESSAGE: Unable to reach the kidozen server. Make sure your KidoZenAppCenterUrl and KidoZenAppName are correct");
                                                           }
                                                       }];
}

- (void)conectionSuccessfulWithResponse:(KZResponse*)response{
    if ([delegate respondsToSelector:@selector(conectionSuccessfulWithResponse:)])
    {
        [delegate conectionSuccessfulWithResponse:response];
    }
}

@end
