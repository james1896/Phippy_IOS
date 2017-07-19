//
//  PHIUserManager.h
//  Phippy
//
//  Created by toby on 19/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PHIUserManager : NSObject

+ (instancetype)shareManager;

@property (nonatomic) BOOL downloadImageOnlyWifi;

@end
