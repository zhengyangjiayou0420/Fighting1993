//
//  TRPoetry.m
//  Demo03-poetry
//
//  Created by 风尘一粒沙 on 15/12/24.
//  Copyright © 2015年 风尘一粒沙. All rights reserved.
//

#import "TRPoetry.h"
#import "TRDataManager.h"

@implementation TRPoetry
+(NSArray *)getAllPoetryWithCategory:(NSString *)categoryName{
    //带条件的查询
    
    //1.拿到db对象
    FMDatabase *db = [TRDataManager sharedDatabase];
    
    //2.有条件的查询(循环 + 赋值)
  FMResultSet *resultSet = [db executeQueryWithFormat:@"select * from T_SHI where D_KIND = %@",categoryName];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    while ([resultSet next]) {
        TRPoetry *poetry = [TRPoetry new];
        poetry.poemContent = [resultSet stringForColumn:@"D_SHI"];
        poetry.poemIntroduction = [resultSet stringForColumn:@"D_INTROSHI"];
        poetry.poemAuthor = [resultSet stringForColumn:@"D_AUTHOR"];
        poetry.poemCategory = [resultSet stringForColumn:@"D_KIND"];
        poetry.poemID =[NSNumber numberWithInt:[resultSet intForColumn:@"D_ID"]];
        poetry.poemTitle = [resultSet stringForColumn:@"D_TITLE"];
        [mutableArray addObject:poetry];
        
 }
    //3.
    [db close];
    
    return  [mutableArray copy];
}

+(BOOL)deletePoemWithID:(NSInteger *)poemID{
    //db
    FMDatabase *db = [TRDataManager sharedDatabase];
    //delete SQL
   BOOL isSuccess = [db executeUpdateWithFormat:@"delete from T_SHI where D_ID = %@",poemID];
    //close
    [db close];
    
    return isSuccess;
}
@end
