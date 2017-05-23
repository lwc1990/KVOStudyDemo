//
//  LWCKVONotifying_Student.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "LWCKVONotifying_Student.h"
#import <objc/Object.h>
extern NSString *const ObserverKey;
@implementation LWCKVONotifying_Student
-(void)setName:(NSString *)name
{
    [super setName:name];
    //获取观察者
    id observer = objc_getAssociatedObject(self,ObserverKey);
    [observer observeValueForKeyPath:ObserverKey ofObject:self change:nil context:nil];

}
@end
