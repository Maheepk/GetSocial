//
//  CentralDataManager.m
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import "CentralDataManager.h"

@implementation CentralDataManager


#pragma mark - Shared Manager
+ (CentralDataManager *)sharedManager
{
    static CentralDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
      
    });
    
    return _sharedManager;
}
@end
