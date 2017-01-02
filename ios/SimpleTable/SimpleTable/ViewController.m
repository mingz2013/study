//
//  ViewController.m
//  SimpleTable
//
//  Created by tuyou on 14-7-22.
//  Copyright (c) 2014年 tuyoo. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTableCell.h"

@interface ViewController ()

{
    
}

@end

@implementation ViewController
{
    NSArray *tableData;
    NSArray *thumbnails;
    NSArray *prepTime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initialize table data
    tableData = [NSArray arrayWithObjects:
                 @"Egg Benedict",
                 @"Mushroom Risotto",
                 @"Creme Brelee",
                 @"White Chocolate Donut",
                 @"Starbucks Coffee",
                 @"Vegetable Curry",
                 @"Instant Noodle with Egg",
                 @"Noodle with BBQ Pork",
                 @"Japanese Noodle with Pork",
                 @"Green Tea",
                 @"Thai Shrimp Cake",
                 @"Angry Birds Cake",
                 @"Ham and Cheese Panini",
                 nil];
    
    thumbnails = [NSArray arrayWithObjects:
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  @"test.png",
                  @"test2.png",
                  nil];
    
    prepTime = [NSArray arrayWithObjects:
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               @"test.png",
               @"test2.png",
               nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *simpleTableIdentifier = @"SimpleTableItem";
//    
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];    // 方法迒回的是一个可重用的表规图单 元格对象。
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
////    cell.imageView.image = [UIImage imageNamed:@"test.png"];
//    cell.imageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    
    
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    SimpleTableCell* cell = (SimpleTableCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        
        cell = [nib objectAtIndex:0];
    }
    
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIAlertView* messageAlert = [[UIAlertView alloc] initWithTitle:@"行选择" message:@"你已经选择了一行！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];    // ????
//    [messageAlert show];
    
    SimpleTableCell* cell = (SimpleTableCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.prepTimeLabel.text = @"test";
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
//    cell.accessoryType = UITableViewCellAccessoryDetailButton;
}


@end





