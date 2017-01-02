//
//  main.m
//  Shapes-Object-2
//
//  Created by tuyou on 14-7-21.
//  Copyright (c) 2014年 tuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 有关术语
 新技术的产生总是伴随着新术语的出现。为了全面理解继承的机制，你需要掌握以下词汇。
 超类(superclass)被继承的类。Circle的超类是Shape，Shape的超类是NSObject。
 父类(parent class)是超类的另一种说法，与超类的意思一样。
 子类(subclass)执行继承的类。Circle就是Shape的子类，而Shape是NSObject的子类。
 孩子类(child class)子类的另一种说法，与子类的意思一样。我喜欢说父/子类
 重写(override)，子类对父类同名方法的重新定义，例如Circle有draw方法的重新定义，所以我们就说Circle重写了Shape的draw方法。
 继承的工作机制
 方法调度
 对象在收到消息时，如何知道要执行哪个方法呢？假如我们已经将setFillColor：的代码移出了Circle类和Rectangle类，当向Circle的对象发送setFillColor:方法时，Shape类的代码如何 响应呢？秘密在于：当代码发送消息时，Objective-C的方法调度机制将在当前的类中搜索相应的方法。如果无法在接收消息的对象的类中找到相应的方法，它就会在该对象的父类进行查找。如果还是没有找到，它会继续向父类的父类中进行查找，直到找到这个方法为止，如果到了最顶层的父类还是找不到这个方法，则会出现一个运行时错误，同时还会出现一个编译时警告。
 实例变量
 在创建一个新类时，其对象首先会从它的父类继承实例变量，然后根据自身情况添加自己的实例变量。
 还有，每个方法调用都获得了一个名为self的隐藏参数，它是一个指向接收消息的对象的指针。这些方法通过self参数来寻找它们需要用到的实例变量。
 重写方法
 在你制作全新的子类时，经常会添加自己的方法。有时你会添加一个能够向类中引入特有功能的新方法，有时你会替换或改进某个超类定义的现有方法。
 在Shapes-Inheritance示例中，Shape已经实现了我们想要完成的多数工作，但它不知道，也无法知道如何进行绘制，因为每个形状的绘制都不相同。所以我们在Shape类中提供了一个draw方法，但让该方法的实现内容为空，当需要创建Circle类时，它继承Shape类，然后再编写具体用来绘制圆形的draw方法。这时我们就说Circle重写了draw方法。
 向Cricle对象发送draw消息时，方法调度机制将运行重写后的方法：Circle类的；draw实现。父类中定义的draw实现会被完全忽略。这个例子这样做是没有问题的，因为父类Shape里本来就没有任何的实现，但有时我们可以希望调用到父类的draw方法而不是Circle的draw方法，这就要使用到一个关键字super。
 super关键字
 super关键字使得Objective-C既可以重写方法的实现，又可以调用父类中的实现。如果需要父类实现一定的功能，然后可以在子类里进行扩展的时候，super关键字就显得很有用。
 Super来自哪里呢？它既不是参数也不是实例变量，而是由Objective-C编译器提供的一种神奇的功能。当你向super发送消息时，实际上是请求Objective-C向该类的父类发送消息。如果父类没有定义该消息，Objective-C会和平常一样继续在继承链的上一级中查找。
 说明  重写方法时，调用父类方法总是一个明知之举，因为这样可以保证获得父类方法实现的所有特性。

 **/


//形状类型
typedef enum{
    kCircle,//圆形
    kRectangle,//矩形
    kEgg,//椭圆
    kTriangle
}ShapeType;

//颜色类型
typedef enum{
    kRedColor,//红色
    kGreenColor,
    kBlueColor
}ShapeColor;


//矩形，不考虑绘制
typedef struct{
    int x;
    int y;
    int width;
    int height;
}ShapeRect;

//获得颜色名称字符串
NSString *colorName(ShapeColor color){
    switch (color) {
        case kBlueColor:
            return @"蓝色";
        case kGreenColor:
            return @"绿色";
        case kRedColor:
            return @"红色";
        default:
            break;
    }
}//colorName


// 新添加的父类Shape
@interface Shape : NSObject
{
    ShapeColor fillColor;
    ShapeRect bounds;
}
-(void)draw;
-(void)setFillColor:(ShapeColor)fillColor;
-(void)setBounds:(ShapeRect)bounds;

@end
@implementation Shape

-(void)setFillColor:(ShapeColor)c{
    fillColor = c;
}
-(void)setBounds:(ShapeRect)b{
    bounds = b;
}

// 因为子类要重写，所以这里对draw进行了空实现
-(void)draw{}

@end


// 圆形类，继承Shape
@interface Circle : Shape

@end
@implementation Circle

-(void)draw{
    NSLog(@"在(%d, %d)处绘制一个宽%d高%d的%@圆形", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}

@end

//矩形类，继承Shape
@interface Rectangle : Shape
@end//Rectangle类的声明

@implementation Rectangle
- (void) draw{
    NSLog(@"在(%d,%d)处绘制一个宽%d高%d的%@矩形",bounds.x,bounds.y,bounds.width,bounds.height,colorName(fillColor));
}
@end//Rectangle类的实现

//椭圆类，继承Shape
@interface Egg : Shape
@end//Egg类的声明

@implementation Egg
- (void) draw{
    NSLog(@"在(%d,%d)处绘制一个宽%d高%d的%@椭圆",bounds.x,bounds.y,bounds.width,bounds.height,colorName(fillColor));
}
@end//Egg类的实现



//OOP方式的drawShapes，本示例未改动
void drawShapes(id shapes[],int count){
    for (int i=0; i<count; i++) {
        [shapes[i] draw];
    }
}//drawShapes




int main(int argc, const char * argv[]) {
    id shapes[3];
    ShapeRect rect0={0,0,10,30};
    shapes[0]=[Circle new];
    [shapes[0] setFillColor: kRedColor];
    [shapes[0] setBounds:rect0];
    
    ShapeRect rect1={30,40,50,60};
    shapes[1]=[Rectangle new];
    [shapes[1] setFillColor: kGreenColor];
    [shapes[1] setBounds:rect1];
    
    ShapeRect rect2={15,19,37,29};
    shapes[2]=[Egg new];
    [shapes[2] setFillColor: kBlueColor];
    [shapes[2] setBounds:rect2];
    
    
    drawShapes(shapes,3);
    return 0;
}
