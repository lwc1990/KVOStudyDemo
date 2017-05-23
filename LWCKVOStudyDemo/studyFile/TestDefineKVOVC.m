//
//  TestDefineKVOVC.m
//  LWCKVOStudyDemo
//
//  Created by syl on 2017/5/23.
//  Copyright © 2017年 personCompany. All rights reserved.
//

#import "TestDefineKVOVC.h"
#import "Student.h"
#import "NSObject+SelfKVO.h"
@interface TestDefineKVOVC ()
@property (nonatomic,strong) Student *stu;
@end

@implementation TestDefineKVOVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLwcObserver];
}
-(void)addLwcObserver
{
    self.stu = [[Student alloc]init];
    [self.stu lwc_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"keyPath:%@,self.stu.name:%@",keyPath,self.stu.name);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.stu.name = [NSString stringWithFormat:@"name_lwc"];
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
