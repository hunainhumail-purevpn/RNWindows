//
//  MyEventEmitter.m
//  NativeReactIOS
//
//  Created by Basit on 15/03/2023.
//
#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTBridge.h"
#import "React/RCTEventDispatcher.h"
//@interface RCT_EXTERN_MODULE(MyEventEmitter, NSObject)
//RCT_EXTERN_METHOD(changeText:(NSString *)message)
//RCT_EXTERN_METHOD(sendMessageToReact:(NSString *)message)
//@end

@interface RCT_EXTERN_MODULE(MyEventEmitter, NSObject);

RCT_EXTERN_METHOD(emitEvent:(NSString *)body)
RCT_EXTERN_METHOD(receiveData:(NSArray *)body)

@end
