//
//  KidoZenConnectionManager.h
//  KidoZenBlankProject
//
//  Created by KidoZen Inc on 6/30/14.
//  Copyright (c) 2014 KidoZen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KZApplication.h"
#import "KZResponse.h"

@protocol KZConnectionManagerDelegate <NSObject>
- (void)conectionSuccessfulWithResponse:(KZResponse*)response;
@end

@interface KZConnectionManager : NSObject
@property (nonatomic, strong) id<KZConnectionManagerDelegate> delegate;

@end

