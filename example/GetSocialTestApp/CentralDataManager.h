//
//  CentralDataManager.h
//  GetSocialTestApp
//
//  Created by Sucharu hasija on 12/01/16.
//  Copyright © 2016 GrambleWorld. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResponseDataProtocol.h"

@interface CentralDataManager : NSObject
@property(strong,atomic) id<ResponseDataProtocol> delegate;
+ (CentralDataManager *)sharedManager;
@end
