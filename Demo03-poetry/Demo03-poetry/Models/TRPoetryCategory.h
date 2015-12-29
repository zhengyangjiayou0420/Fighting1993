//
//  TRPoetryCategory.h
//  Demo03-poetry
//
//  Created by 风尘一粒沙 on 15/12/24.
//  Copyright © 2015年 风尘一粒沙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRPoetryCategory : NSObject
@property(nonatomic,strong)NSString *poemCategoryName;
//唯一的
@property(nonatomic,strong)NSNumber *poemID;
//诗的描述
@property(nonatomic,strong)NSString  *poemIntroduction;
@property(nonatomic,strong)NSString *poemComments;
//返回已经转换好了的所有诗词对象数组(TRPoetryCategory)
+(NSArray *)getAllPoetryCategory;
@end
