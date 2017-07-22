//
//  T_Base.m
//  Phippy
//
//  Created by toby on 22/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "T_Base.h"
#import <objc/runtime.h>

@implementation T_Base

- (NSString *)getClassName{
    NSString *name = NSStringFromClass([self class]);
    return name.lowercaseString;
}

- (NSArray *)getAllProperties{
    u_int count;
    
    //使用class_copyPropertyList及property_getName获取类的属性列表及每个属性的名称
    
    objc_property_t *properties  =class_copyPropertyList([obj class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        NSLog(@"属性%@\n",[NSString stringWithUTF8String: propertyName]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}

@end
