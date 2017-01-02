//
//  main.m
//  CarParts
//  类与类的关系：复合
//  Created by mouyong on 13-6-23.
//  Copyright (c) 2013年 mouyong. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Tire : NSObject
@end //Tire

@implementation Tire
/**
 为SNLog定义输出字符串
 NSLog()可以使用%@格式说明符来输出对象。NSLog()处理%@说明符时，会调用对象的description方法，然后对象的description方法生成一个NSString并将其返回。NSLog()就会在输出结果中包含这个字符串。在类中提供description方法就可以自定义NSLog()会如何输出对象。
 **/
- (NSString *)description{
    return (@"我是一个轮胎");
}//description

@end//Tire


@interface Engine : NSObject

@end//Engine
@implementation Engine

- (NSString *)description{
    return @"我是一个发动机";
}//description
@end//Engine

@interface Car : NSObject
{
    Engine *engine;
    Tire *tires[4];
}
-(void)print;
@end//Car
@implementation Car

- (id) init{
    if (self=[super init]) {
        engine=[Engine new];
        tires[0]=[Tire new];
        tires[1]=[Tire new];
        tires[2]=[Tire new];
        tires[3]=[Tire new];
    }
    return self;
}//init
- (void) print{
    NSLog(@"%@",engine);
    NSLog(@"%@",tires[0]);
    NSLog(@"%@",tires[1]);
    NSLog(@"%@",tires[2]);
    NSLog(@"%@",tires[3]);
}//print

@end//Car
int main(int argc, const char * argv[])
{
    
    Car *car;
    car=[Car new];
    [car print];
    return 0;
}//main