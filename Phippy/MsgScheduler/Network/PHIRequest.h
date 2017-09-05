//
//  PHIRequest.h
//  Phippy
//
//  Created by toby on 21/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "TBRequest.h"

@interface PHIRequest : TBRequest

+ (void)storeWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

+ (void)goodsWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

+ (void)tourWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

+ (void)lifeWithParameters:(NSDictionary *)parameters success:(success)success failure:(failure)failure;

@end
