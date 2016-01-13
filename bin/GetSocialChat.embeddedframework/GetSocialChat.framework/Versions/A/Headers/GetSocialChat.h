//
//  GetSocialChat.h
//  GetSocialSDK
//
//  Created by Gramble World on 14/04/15.
//  Copyright (c) 2015 GetSocial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GetSocialChatViewBuilder.h"
#import "GetSocialChatListViewBuilder.h"
#import "GetSocialChatConfigurationProperties.h"

/**
 *  The GetSocial Singleton provides the main entry point for all the social features in the Core module
 */
@interface GetSocialChat : NSObject

#pragma mark - Singleton
/** @name Singleton */

/**
 *  Gets the shared instance of GetSocialChat
 *
 *  @return GetSocialChat instance
 */
+ (instancetype)sharedInstance;

#pragma mark - Properties
/** @name Properties */

/**
 *  Gets number of unread conversations
 */
@property(nonatomic, readonly) NSInteger unreadConversationsCount;


/**
 *  Gets if the Chat Module is enabled
 */
@property(nonatomic, readonly) BOOL isEnabled;

/**
 *  Registers a block to get updates on the notifications
 *
 *  @param onChatNotificationsChangeHandler Block called when the unread conversations count changes.
 */
- (void)setOnChatNotificationsChangeHandler:(void (^)(NSInteger unreadConversationsCount))onChatNotificationsChangeHandler;

/**
 *  Creates chat view builder used to open the Chat View.
 *
 *  @param userId Id of the user to chat with
 *
 *  @return  An instance of GetSocialChatViewBuilder
 */
- (GetSocialChatViewBuilder*)createChatViewForUserId:(NSString*)userId;

/**
 *  Creates chat view builder used to open the Chat View.
 *
 *  @param userId     Id of the user to chat with
 *  @param providerId Id of the external provider
 *
 *  @return An instance of GetSocialChatViewBuilder
 */
- (GetSocialChatViewBuilder*)createChatViewForUserId:(NSString*)userId onProvider:(NSString*)providerId;

/**
 *  Creates chat view builder used to open the Chat View.
 *
 *  @param conversationId Id of the chat conversation
 *
 *  @return An instance of GetSocialChatViewBuilder
 */
- (GetSocialChatViewBuilder*)createChatViewForConversationId:(NSString*)conversationId;

/**
 *  Creates chat view builder used to open the Chat View.
 *
 *  @param roomName Name of the chat room
 *
 *  @return An instance of GetSocialChatViewBuilder
 */
- (GetSocialChatViewBuilder*)createChatViewForRoomName:(NSString*)roomName;

/**
 *  Creates chat list view builder used to open the Chat List View.
 *
 *  @return An instance of GetSocialChatListViewBuilder
 */
- (GetSocialChatListViewBuilder*)createChatListView;

@end
