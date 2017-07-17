//
//  PHIDBHelper.m
//  Phippy
//
//  Created by toby on 17/07/2017.
//  Copyright © 2017 kg.self.edu. All rights reserved.
//

#import "PHIDBHelper.h"
#import "FMDatabase.h"

@interface PHIDBHelper ()
@property (nonatomic, strong) FMDatabase *db;
@end

@implementation PHIDBHelper


+ (void)insert{
    
    
    for (int i = 0; i<10; i++) {
        NSString *name = [NSString stringWithFormat:@"jack-%d", arc4random_uniform(100)];
        // executeUpdate : 不确定的参数用?来占位，参数都必须是对象
        [[self shareInstance].db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
        //        [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?, ?);" withArgumentsInArray:@[name, @(arc4random_uniform(40))]]; // ?方式，参数要是对象，不是对象要包装为对象
        
        // executeUpdateWithFormat : format方式拼接，不确定的参数用%@、%d等来占位
        //        [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES (%@, %d);", name, arc4random_uniform(40)];
        // 注意：如果直接写%@不用加单引号两边，会自动加单引号两边，如果'jack_%d'的两边不加单引号就会报错，所以要注意
        [[self shareInstance].db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES ('jack_%@', %d);", name, arc4random_uniform(40)];
    }
    
  
}

+ (void)update{

}

+ (void)query{
    // 1.执行查询语句
    FMResultSet *resultSet = [[self shareInstance].db executeQuery:@"SELECT * FROM t_student"];
    
    // 2.遍历结果
    while ([resultSet next]) {
        int ID = [resultSet intForColumn:@"id"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    
}

+ (void)delData{
    [[self shareInstance].db executeUpdate:@"DROP TABLE IF EXISTS t_student;"];
    [[self shareInstance].db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
    
 
}

/*  ~~~~~~~~~~~~~~~~~~~~~~~     单例      ~~~~~~~~~~~~~~~~~~~~~~~~~~   */

#pragma mark lift cycle

static PHIDBHelper * _instance = nil;

+ (PHIDBHelper *)shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];

        
        // 1.获得数据库文件的路径
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSString *filename = [doc stringByAppendingPathComponent:@"students.sqlite"];
        
        // 2.得到数据库
        FMDatabase *db = [FMDatabase databaseWithPath:filename];
        
        // 3.打开数据库
        if ([db open]) {
            // 4.创表
            BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
            if (result) {
                NSLog(@"成功创表");
            } else {
                NSLog(@"创表失败");
            }
        }
        _instance.db = db;
    }) ;
    return _instance ;
}


+ (id) allocWithZone:(struct _NSZone *)zone
{
    return [PHIDBHelper shareInstance] ;
}

- (id) copyWithZone:(struct _NSZone *)zone
{
    return [PHIDBHelper shareInstance] ;
}

@end
