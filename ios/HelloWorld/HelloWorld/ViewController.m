//
//  ViewController.m
//  HelloWorld
//
//  Created by tuyou on 14-7-22.
//  Copyright (c) 2014年 tuyoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)showMessage:(id)sender forEvent:(UIEvent *)event;


@end
@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (IBAction)showMessage:(id)sender forEvent:(UIEvent *)event {
////    UIAlertView* helloWorldAlert = [[UIAlertView alloc] initWithTitle:@"My First App" message:@"Hello, World!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
////
////    // Display the Hello World Message
////    [helloWorldAlert show];
//}

- (IBAction)showMessage:(id)sender forEvent:(UIEvent *)event {
       UIAlertView* helloWorldAlert = [[UIAlertView alloc] initWithTitle:@"My First App" message:@"Hello, World!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
       // Display the Hello World Message
       [helloWorldAlert show];
}
@end