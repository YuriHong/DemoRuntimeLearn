//
//  TestObject.h
//  DemoRuntimeLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestObject : NSObject

@property (strong) NSString *name;
@property (strong) NSString *age;

- (void)testMethod:(NSString *)text;

- (void)funcTestMethod;

@end

NS_ASSUME_NONNULL_END
