//
//  NSObject+SelfKVO.h
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SelfKVO)
-(void)lwc_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context;

@end
