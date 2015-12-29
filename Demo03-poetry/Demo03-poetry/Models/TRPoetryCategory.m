//
//  TRPoetryCategory.m
//  Demo03-poetry
//
//  Created by 风尘一粒沙 on 15/12/24.
//  Copyright © 2015年 风尘一粒沙. All rights reserved.
//

#import "TRPoetryCategory.h"
#import "TRDataManager.h"
@implementation TRPoetryCategory

+(NSArray *)getAllPoetryCategory{
    //获取db对象
    FMDatabase *db = [TRDataManager sharedDatabase];
    //从T_KIND表中取数据(循环 + 模型对象赋值 +添加到数组中)
 FMResultSet * resultSet = [db executeQuery:@"select *from T_KIND"];
    //可变数组
    NSMutableArray *mutableArray = [NSMutableArray array];
    while ([resultSet next]) {
        //创建一个空的模型对象
        TRPoetryCategory *category = [TRPoetryCategory new];
        //从resultSet取值,并复制给模型对象
        category.poemCategoryName = [resultSet stringForColumn:@"D_KIND"];
        category.poemID =[NSNumber numberWithInt:[resultSet intForColumn:@"D_NUM"]];
        category.poemIntroduction = [resultSet stringForColumn:@"D_INTROKIND"];
        category.poemComments = [resultSet stringForColumn:@"D_INTROKIND2"];
        //添加数组
        [mutableArray addObject:category];
       
    }
    //收尾工作
    [db close];
    
    return [mutableArray copy];
    
}
@end
