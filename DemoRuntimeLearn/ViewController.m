//
//  ViewController.m
//  DemoRuntimeLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>
#import "TestObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)runtimeTest:(UIButton *)sender {
    
    // 获取IMP
    
    [self example:@"获取IMP" excute:^{
        //函数指针
        
        //        function = (id self, SEL _cmd, NSObject *object)[self methodForSelector:@selector(viewDidLoad)];
        
        TestObject *obj = [[TestObject alloc]init];
        
        void (*f) (id self, SEL _cmd, NSString*);
        f = [obj methodForSelector:@selector(testMethod:)];
        f(obj,@selector(testMethod:), @"Helo world");
        
        void (*func)(id, SEL) = (void (*)(id, SEL))class_getMethodImplementation([TestObject class], @selector(funcTestMethod));
        func(obj, @selector(funcTestMethod));
        
        //        IMP function = [obj methodForSelector:@selector(testMethod:)];
        //        function(id obj, @"Hello");
        
        IMP function = imp_implementationWithBlock(^(id self, NSString *text) {
            NSLog(@"callback block: %@",text);
        });
        
        const char *types = sel_getName(@selector(testMethod:));
        class_replaceMethod([TestObject class], @selector(testMethod:), function, types);
        [obj testMethod:@"Yu"];
    }];
    
    [self example:@"获取实力对象的属性列表和协议列表" excute:^{
        unsigned count = 0;
        objc_property_t *t = class_copyPropertyList([TestObject class], &count);
        for (int i = 0; i < count; i++) {
            objc_property_t property = t[i];
            const char *name = property_getName(property);
            NSLog(@"%s", name);
        }
        free(t);
    }];
    
}

- (void)example:(NSString *)name excute:(Example)excute
{
    NSLog(@"--->%@ begin<----", name);
    excute();
    NSLog(@"--->%@ end<----", name);
}


@end
