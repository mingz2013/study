//
//  main.m
//  Shapes-Object
//
//  Created by tuyou on 14-7-21.
//  Copyright (c) 2014年 tuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

/***
 我们可以重新创建一个项目，但Shapes-Procedural中的枚举类型和结构体ShapeRect必须保留。下面是Shapes-Object的完整源代码。（默然说话：在敲下面的代码时我发现了一个Xcode 4.6的所谓bug，它会造成我们下面的代码产生一个误报:Must explicitly describe intended ownership of an object array parameter。如果你看到了这个错误信息，你可以选中左边的项目名，然后再选中右边的PROJECT-->Apple LLVM compiler 4.2 - Language-->Objective-C Automatic Reference Counting，它本来的值是Yes，将它的值改为No，就可以正常编译运行了。如果看不懂，可以将错误信息放到百度里进行搜索，可以得到更详细的说明）
 
 **/


// 形状类型
typedef enum{
    kCircle,    // 圆形
    kRectangle, // 矩形
    kEgg,       // 椭圆
    kTriangle
} ShapeType;

// 颜色类型
typedef enum{
    kRedColor,
    kGreenColor,
    kBlueColor
} ShapeColor;

// 矩形 不考虑绘制
typedef struct{
    int x;
    int y;
    int width;
    int height;
} ShapeRect;

// 获得颜色名称字符串
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
}
/**
 
 先来看一下用于声明新类的语法： @interface Circle:NSObject
 冒号后面的标识符是需要继承的类。在Objective-C中你可以选择不继承，但如果你使用的是Cocoa框架，就需要继承NSObject类，因为它提供了大量有用的特性，如果你继承了一个继承NSObject类的类时，也可以获取这些特性。
 **/
// 替代Shape的圆形类， 最大特点就是数据与方法绑定了
@interface Circle : NSObject
/**
 创建某个特定类的对象之前，Objective-C编译器需要一些有关该类的信息，尤其是对象的数据成员（即对象的C语言类型结构体应该是什么样子）及其提供的功能。可以使用@interface指令把这些信息传递给编译器。
 这句代码的意思就是告诉编译器：“这是新类Circle的接口，它继承了NSObject”。
 声明完新类之后，我们将告诉编译器Circle对象需要的各种数据成员。
 **/
{
    @private
    ShapeColor fillColor;
    ShapeRect bounds;
    /**
     它们的意思和前面的Shape结构体是差不多的，只不过这里是类而已。在类声明中指定fillColor和bounds后，每次创建Circle对象，对象中都包含这两个元素。因此，每Circle类对象都将拥有自己的fillColor和bounds。fillColor和bounds的值称为Circle类的实例变量(instance variable)。
     **/

}
//接下来的几行代码看起来有点像C语言中的函数原型。
/**
 在Objective-C中，它们称为方法声明(method declaration)。它们看起来很像是旧式的C语言函数原型，用于说明“这是我支持的功能”。方法声明列出了每个方法的名称、方法返回值的类型和某些参数。
 **/
-(void)draw;
/**
 前面的短线表明这是Objective-C方法的声明。这是区分函数原型与方法声明的一种方式，函数原型中没有先行短线。短线后是方法的返回类型，位于圆括号中。在我们的示例中，draw方法仅用于绘制图形，并不返回值。Objective-C使用void表示无返回值。
 Objective-C方法可以返回与C函数相同的类型：标准类型（整数、浮点型和字符串）、指针、引用对象和结构体。
 **/
-(void)setFillColor:(ShapeColor)fillColor;
/**
 接下来的两个方法都带有一个参数，一定要注意它们的格式。首先是短线和返回值开头：
 (void)
 然后是方法名：
 setFillColor:
 注意结尾处的冒号是名称的一部分，它告诉编译器和编程人员后面还有参数。
 (ShapeColor) fillColor
 圆括号里指定的是参数类型，紧随其后的是参数名称。
 
 注意冒号
 注意，冒号是方法名称非常重要的组成部分。记住这样一个规则：如果方法有参数，则需要冒号，否则不需要冒号
 **/
-(void)setBounds:(ShapeRect)bounds;

@end    // Circle类的声明
@implementation Circle  // 第一行代码中的@implementation是一个编译器指令，表明你将为某个类提供代码。类名出现在之后。结尾处没有分号。
/**
 
 接下来是各方法的定义。它们不必按照在@interface指令中的顺序出现。你甚至可以在@implementation中定义那些在@interface中没有声明过的方法。但是你要注意，Objective-C中不存在真正的私有方法，也无法把某个方法标识为私有方法，从而禁止其他代码调用它。这是Objective-C动态本质的副作用。
 你们应该已经注意到了，在实现方法的时候，我们修改了变量名（fillColor变成了c，而bounds变成了b）。@interface和@implementation间的参数名不同是允许的。在这里，如果我们继续使用参数名fillColor或bounds，就会覆盖实例变量，并且编译器会生成警告信息。（默然说话：我试过，Objective-C似乎并没有this之类的对象，所以没办法，只能改名字。坑爹呀。）
 在@interface部分的方法声明中使用名称fillColor只是为了告诉读者参数的作用。而在实现中，由于我们必须区分参数名和实例变量名，所以最简单的方式就是将参数改名。
 最后一个方法draw。注意，方法名的结尾处没有冒号，说明它不使用任何参数。
 **/
-(void)setFillColor:(ShapeColor)c{
    fillColor = c;
}// setFillColor

-(void)setBounds:(ShapeRect)b{
    bounds = b;
}// setBounds

-(void)draw{
    NSLog(@"在(%d, %d)处绘制一个宽%d高%d的%@圆形", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}// draw


@end    // Circle类的实现

// 替代Shape的矩形类，最大特点就是数据与方法绑定了
@interface Rectangle : NSObject
{
    @private
    ShapeColor fillColor;
    ShapeRect bounds;
}
-(void)draw;
-(void)setFillColor:(ShapeColor)fillColor;
-(void)setBounds:(ShapeRect)bounds;

@end    // Rectangle类的声明

@implementation Rectangle

-(void)setFillColor:(ShapeColor)c{
    fillColor = c;
}
-(void)setBounds:(ShapeRect)b{
    bounds = b;
}
-(void)draw{
    NSLog(@"在(%d, %d)处绘制一个宽%d高%d的%@矩形", bounds.x, bounds.y, bounds.width, bounds.height, colorName(fillColor));
}


@end

//替代Shape的椭圆类，最大特点就是数据与方法绑定了
@interface Egg : NSObject
{
@private
    ShapeColor fillColor;
    ShapeRect bounds;
}
- (void) draw;
- (void) setFillColor:(ShapeColor) fillColor;
- (void) setBounds:(ShapeRect) bounds;

@end//Egg类的声明

@implementation Egg

- (void) setFillColor: (ShapeColor) c{
    fillColor=c;
}//setFillColor
- (void) setBounds: (ShapeRect) b{
    bounds=b;
}//setBounds
- (void) draw{
    NSLog(@"在(%d,%d)处绘制一个宽%d高%d的%@椭圆",bounds.x,bounds.y,bounds.width,bounds.height,colorName(fillColor));
}
@end//Egg类的实现


/***
 代码里面最神奇的，就是drawShapes()函数，和以前的版本相比，它变得出奇的简单，一个循环，一个draw()函数的调用，程序就能完成正确的绘制，而不需要象以前那样去一一识别。逻辑一下变得非常的简单。对象真的能知道自己该做什么事情！
 */
// OOP方式的drawShapes
void drawShapes(id shapes[], int count){
    for (int i = 0; i < count; i++) {
        [shapes[i] draw];
    }
}


/**
 我们最后要介绍的是Shapes-Object程序中非常关键的过程。在该过程中，我们创建了形状对象，比如红色的圆形和绿色的矩形。这个过程的专业术语叫做实例化(instantiation)。实例化对象时，需要分配内存，然后将这些内存初始化并保存为有用的默认值，这些值不同于通过新分配的内存获得的随机值（默然说话：给没学过C语言的同学补充下：C语言中分配内存就是分配内存，并不会象其他语言那样给已分配内存一个默认值，这些内存里会放个原来的某些莫名其妙的值，我们称它们为随机值）内存分配和初始化工作完成后，就意味着新的对象实例已经创建好了。
 
 为了创建一个新的对象，我们需要向相应的类发送new消息。该类接收并处理完new消息后，我们就会得到一个可以使用的新对象实例。
 Objective-C具有一个极好的特性，你可以把类当成对象来发送消息。对于那些不局限于某个特定的对象而是对全体类都能用的操作来说，这非常便捷。最好的例子就是给新对象分配空间。
 以下是main()函数的代码，它用于创建圆形、矩形和椭圆形。
 main()函数中的代码显得有些稀奇古怪，这些不过是Objective-C的语法而已，让我们来仔细的分析一下：
 这句代码完成了一个数组的声明，数组的类型是id，它是Objective-C中定义的可以指向任意类型的指针。
 在Objective-C中，通知对象执行某种操作称为发送消息，也叫方法调用。[Circle new]、[shapes[0] setFillColor: kGreenColor]等等带中括号的代码，都是发送消息的语法。
 
 Objective-C有一种名为中缀符（infix notation）的语法技术。方法的名称及其参数都是合在一起的。例如，你可以这样调用带一个参数的方法：
 [circle setFillColor: kRedColor];
 带两个参数的方法调用如下所示：
 [textThing setStringValue:@”hello there” color:kBlueColor];
 setStringValue:和color:都是参数名（事实上它们是方法名称的一部分，后面会详细介绍），@”hello there”和kBlueColor是被传递的参数。
 这种语法和C不同，C语言调用函数时，是把所有的参数都放在函数名之后的小括号中。
 中缀语法的优点就是它使代码的可读性更强，参数的用途更容易理解，缺点就是调用代码写得太长，显得比较罗嗦和麻烦。
 **/
int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
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

/**
 扩展Shapes-Object程序
 还记得我们在Shapes-Procedural程序中增加绘制三角形的功能吗？下面我们在Shapes-Object中也增加同样的功能。但是这次操作就简单多了，我们只需要创建一个新类，然后在main()函数中新添加一段初始化的代码，而无需象原来一样修改N个地方，一不小心改错就带来无尽的麻烦。（默然说话：Triangle类我就不贴出了，大家自己试试吧！）
 Shapes-Object中的代码正好验证了面向对象编程大师Bertrand Meyer的开/闭原则。即软件实体应该对扩展开放，对修改关闭。遵循开/闭原则的软件会更加坚实耐用，因为你不必修改那些可正常运行的代码。
 
 
 
 小结
 本章指出了“函数第一，数据第二”这种观念导致的局限性。介绍了面向对象的编程 ，它坚持“数据第一，函数第二”的编程风格。
 下一章我们将介绍继承，该特性可以让你充分利用现有对象的行为，编写更少的代码来完成工作。听起来很棒吧！
 
 **/
