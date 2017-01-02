//
//  AppDelegate.h
//  HelloWorld
//
//  Created by tuyou on 14-7-22.
//  Copyright (c) 2014年 tuyoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


//@property 让编译器自动编写一个与数据成员同名的方法声明来省去读写方法的声明。
@property (strong, nonatomic) UIWindow *window;


@end

