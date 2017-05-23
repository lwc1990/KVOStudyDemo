//
//  Person.h
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public NSString *_name;
}
//一旦声明了带下划线的同名的成员变量，这里的@property就不再生成成员变量了，又由于我们重写了setter方法，所以这里@property只是生成了getter方法。
@property (nonatomic,copy) NSString *name;
@end
