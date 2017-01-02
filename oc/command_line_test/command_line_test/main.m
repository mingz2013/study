//
//  main.m
//  command_line_test
//
//  Created by tuyou on 14-7-21.
//  Copyright (c) 2014年 tuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 如果两个整数值相同，返回真，
 否则返回假
 **/
BOOL areIntsDifferent(int thing1,int thing2)
{
    if (thing1 == thing2) {
        return YES;
    }else{
        return NO;
    }
}


/**
 如果收到一个NO值，返回一个字符串的NO
 否则，返回一个字符串的yes
 **/

NSString *boolString(BOOL yesNo)
{
    if (yesNo) {
        return @"YES";
    }else{
        return @"NO";
    }
}


int main(int argc, const char * argv[]) {
//    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    /**
     NSString:@是本体
     在语句中我们看到字符串写成@”Hello,Objective-C!”。@符号是Objective-C在标准C语言基础上添加的特性之一。@符号意味着引号内的字符串应作为Cocoa的NSString元素来处理
     **/
        
//        // 创建一个NSMutableArray对象，用item变量保存新创建的数组对象
//        NSMutableArray *items = [[NSMutableArray alloc] init];
//        
//        // 不要让items指向已经被释放的内存空间
//        items = nil;
    
        
//    }
    
    NSLog(@"第二章============================================");
    BOOL areTheyDifferent;
    areTheyDifferent = areIntsDifferent(5, 5);
    NSLog(@"%d和%d相同不？%@", 5, 5, boolString(areTheyDifferent));
    /**
     如前所见，NSLog()本质上就是具有特色的printf()函数，它接受格式字符串，并将后续参数的值插入到这个格式说明符中。需要特别注意的是，NSLog()里使用了一个%@。它的含义是什么呢？它表示NSLog()接受适当的参数，将其作为NSString（默然说话：对！%s不能输出NSString字符串），并使用该字符串中的字符，将其发送到控制台中。
     说明 使用NSLog()输出任意对象的值时，都会使用%@格式来表示。在使用这个说明符时，对象会通过一个名为description的方法提供自己的NSLog()格式。
     **/
    areTheyDifferent = areIntsDifferent(23, 42);
    NSLog(@"%d和%d相同不？%@", 23, 42, boolString(areTheyDifferent));
    
    NSLog(@"第三章============================================");
    NSLog(@"从1到5得数字");
    for (int i = 1; i <= 5; i++) {
        NSLog(@"%d", i);
    }
    return 0;
}
