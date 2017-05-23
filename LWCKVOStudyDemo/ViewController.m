//
//  ViewController.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
@property (nonatomic,strong) Person *person;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstTest];
}
-(void)firstTest
{
    //首先验证，调用setter方法，才能监听到值的改变，不调用setter方法时，是不会监听到值的改变的。
    self.person = [[Person alloc]init];
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
}
//kvo的回调方法。
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"keyPath:%@,self.p.name:%@",keyPath,self.person.name);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    
    self.person.name = [NSString stringWithFormat:@"name->%d",i++];
    /*
     默认 成员变量是@protected的只能在该类内部或其子类中访问，在外部是不能被访问的。
     所以，我们要给person类再声明一个可以在外部被访问的成员变量。
     */
//    self.person->_name = [NSString stringWithFormat:@"name->%d",i++];
    //结论一：通过getter方法给属性赋值时，在点击的时候，kvo的回调方法被触发了；而在通过引用成员属性赋值的时候，在点击的时候，kvo的回调方法不会被触发。所以，kvo的本质是赋值的时候是否通过setter方法，通过setter方法，则能监听值的变化，否者不能。
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
