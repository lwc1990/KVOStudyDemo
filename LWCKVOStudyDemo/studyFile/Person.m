//
//  Person.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "Person.h"
@interface Person()
@end
@implementation Person
-(void)setName:(NSString *)name
{
    _name = name;
    NSLog(@"%s",__func__);
}
@end
