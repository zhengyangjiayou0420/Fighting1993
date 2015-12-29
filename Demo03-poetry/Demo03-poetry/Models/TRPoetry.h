//
//  TRPoetry.h
//  Demo03-poetry
//
//  Created by 风尘一粒沙 on 15/12/24.
//  Copyright © 2015年 风尘一粒沙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoetry : NSObject
@property(nonatomic,strong)NSString *poemContent;
@property(nonatomic,strong)NSString  *poemIntroduction;
@property(nonatomic,strong)NSString  *poemAuthor;
@property(nonatomic,strong)NSString  *poemCategory;
@property(nonatomic,strong)NSNumber  *poemID;
@property(nonatomic,strong)NSString  *poemTitle;

//给定诗词的分类,返回已经转换完的对应的数组(TRPoetry)
+(NSArray *)getAllPoetryWithCategory:(NSString *)categoryName;
//给定诗词id,返回是否删除成功
+(BOOL)deletePoemWithID:(NSInteger *)poemID;
@end
