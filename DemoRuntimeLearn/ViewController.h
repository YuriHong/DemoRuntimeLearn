//
//  ViewController.h
//  DemoRuntimeLearn
//
//  Created by TRS on 2018/11/9.
//  Copyright © 2018年 TRS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Example)(void);

@interface ViewController : UIViewController

- (void)example:(NSString *)name excute:(Example)excute;

@end

