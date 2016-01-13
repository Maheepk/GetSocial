//
//  GetSocialChatConfigurationProperties.h
//  GetSocialSDK
//
//  Created by Gramble World on 29/04/15.
//  Copyright (c) 2015 GetSocial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetSocialChatConfigurationProperties : NSObject

struct GetSocialChatConfigurationPropertyStruct {
    
    __unsafe_unretained NSString *const CHAT_TOOLTIP_BG_IMAGE; // drawable
    __unsafe_unretained NSString *const CHAT_TOOLTIP_TEXT_STYLE; // text style
    
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_TEXT_STYLE; //text style
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_BG_IMAGE_NORMAL; //drawable
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_BG_IMAGE_PRESSED; //drawable
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_BG_IMAGE_NORMAL_INSETS; //insets
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_BG_IMAGE_PRESSED_INSETS; //insets
    __unsafe_unretained NSString *const MY_CHAT_MESSAGE_TEXT_INSETS; //insets
    
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_TEXT_STYLE; //text style
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_BG_IMAGE_NORMAL; //drawable
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_BG_IMAGE_PRESSED; //drawable
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_BG_IMAGE_NORMAL_INSETS; //insets
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_BG_IMAGE_PRESSED_INSETS; //insets
    __unsafe_unretained NSString *const THEIR_CHAT_MESSAGE_TEXT_INSETS; //insets
    
    __unsafe_unretained NSString *const START_CHAT_BUTTON_TEXT_STYLE; // text style
    __unsafe_unretained NSString *const START_CHAT_BUTTON_TEXT_Y_OFFSET_NORMAL; // dimension
    __unsafe_unretained NSString *const START_CHAT_BUTTON_TEXT_Y_OFFSET_PRESSED; // dimension
    __unsafe_unretained NSString *const START_CHAT_BUTTON_BAR_COLOR; // color
    __unsafe_unretained NSString *const START_CHAT_BUTTON_BG_IMAGE_NORMAL; // drawable
    __unsafe_unretained NSString *const START_CHAT_BUTTON_BG_IMAGE_PRESSED; // drawable
    __unsafe_unretained NSString *const START_CHAT_BUTTON_BG_IMAGE_NORMAL_INSETS; // insets
    __unsafe_unretained NSString *const START_CHAT_BUTTON_BG_IMAGE_PRESSED_INSETS; // insets
    
    __unsafe_unretained NSString *const NO_CHAT_MESSAGES_PLACEHOLDER_BG_IMAGE; // drawable
    
    __unsafe_unretained NSString *const CHAT_INPUT_BAR_BG_COLOR; // color
    
    __unsafe_unretained NSString *const CHAT_MIGRATION_ENABLED; //flag
    
};

extern const struct GetSocialChatConfigurationPropertyStruct GetSocialChatProperty;

@end
