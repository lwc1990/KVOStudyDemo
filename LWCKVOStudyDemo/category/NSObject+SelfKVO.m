//
//  NSObject+SelfKVO.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "NSObject+SelfKVO.h"
#import <objc/message.h>
#import "LWCKVONotifying_Student.h"
NSString *const ObserverKey = @"ObserverKey";
@implementation NSObject (SelfKVO)
// 由于是仿系统的，所以加了前缀
-(void)lwc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    //把观察者保存到当前对象
    objc_setAssociatedObject(self, (__bridge const void *)(ObserverKey),observer,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //修改当前对象的isa指针，原本系统是动态地派生一个类，这里我们可以暂时以Student类为例试一下。
    object_setClass(self,[LWCKVONotifying_Student class]);
}
@end
