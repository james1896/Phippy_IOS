//
//  MsgScheduler.h
//  Phippy
//
//  Created by toby on 21/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsgScheduler : NSObject

+ (NSDictionary *)getFoodStore;
+ (NSDictionary *)getGoodsWithStoreID:(NSString *)storeId;
+ (NSDictionary *)getTourArticles;
@end
