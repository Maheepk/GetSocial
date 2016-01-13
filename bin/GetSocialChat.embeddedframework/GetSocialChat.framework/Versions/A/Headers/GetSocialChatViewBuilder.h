//
//  ChatViewBuilder.h
//  GetSocialSDK
//
//  Created by GetSocial on 17/04/15.
//  Copyright (c) 2015 GetSocial. All rights reserved.
//

#import "GetSocialViewBuilder.h"

/**
 *  Provides a way to build a view to show User List
 *  Should be created only by calling `[[GetSocial sharedInstance] createChatViewForUserId...`
 */
@interface GetSocialChatViewBuilder : GetSocialViewBuilder

- (instancetype)init __unavailable;

@end
