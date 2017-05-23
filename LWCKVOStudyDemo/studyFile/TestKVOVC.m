//
//  TestKVOVC.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "TestKVOVC.h"
#import "Student.h"
@interface TestKVOVC ()
@property (nonatomic,strong) Student *stu;
@end

@implementation TestKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testKVO];
    
}
-(void)testKVO
{
    self.stu = [[Student alloc]init];
    [self.stu addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@,%@",keyPath,self.stu.name);
    //现象：通过在添加kvo观察者处和回调方法中打断点，我们可以看到Debug窗口，在添加观察者之前，stu对象的isa指向Student类，而在添加了观察者之后，回调方法中的断点处，打印的isa指向了NSKVONotifying_Student类
    //结论：当某个类的实例对象的key第一次被观察时，系统就会在运行期间动态地创建该类的派生类NSKVONotifying_类名，在这个派生类中重写该类中被观察者的观察的属性的setter方法。具体是如何重写的可以进一步分析。
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i = 0;
    self.stu.name = [NSString stringWithFormat:@"name->%d",i++];

}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //KVO也可以自己手动发送通知
    [self observeValueForKeyPath:@"name" ofObject:self.stu change:nil context:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
