//
//  MsgScheduler.m
//  Phippy
//
//  Created by toby on 21/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "MsgScheduler.h"
#import "PHIDataAgent.h"
#import "PHIProcessor.h"

@interface MsgScheduler()

@property(nonatomic,strong) PHIDataAgent *dataAgent;
@property(nonatomic,strong) PHIProcessor *processor;
@end

@implementation MsgScheduler


//---------------------------------------
//food
//---------------------------------------
+ (NSDictionary *)getFoodStore{
    
    MsgScheduler *scheduler = [self shareManager];
    scheduler.processor.style = PHIProcessorStyleFood;
    [scheduler.processor start];
    NSDictionary *dict = @{};
    return dict;
}

+ (NSDictionary *)getGoodsWithStoreID:(NSString *)storeId{
    NSDictionary *dict = @{};
    return dict;
}


//---------------------------------------
//tour
//---------------------------------------

+ (NSDictionary *)getTourArticles{
    NSDictionary *dict = @{};
    return dict;
}

- (PHIDataAgent *)dataAgent{
    if(!_dataAgent){
        _dataAgent = [[PHIDataAgent alloc]init];
    }
    return _dataAgent;
}

- (PHIProcessor *)processor{
    if(!_processor){
        _processor = [[PHIProcessor alloc]init];
    }
    return _processor;
}

#pragma mark lift cycle

static MsgScheduler * _instance = nil;
+ (instancetype)shareManager{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
        
    }) ;
    return _instance ;
}


+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [MsgScheduler shareManager] ;
}

- (id) copyWithZone:(struct _NSZone *)zone
{
    return [MsgScheduler shareManager] ;
}
@end
