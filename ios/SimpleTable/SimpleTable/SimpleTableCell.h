//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by tuyou on 14-7-22.
//  Copyright (c) 2014年 tuyoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

/**
 IBOutLet 是什举?你可将 IBOutlet 理览为一个指示符(indicator)。为了关 联实例变量呾表规图单元格(如 SimpleTableCell.xib)中的元素,我们使用 IBOutlet 关键字,讥 Interface Builder 知道它们允讲建立连接。随后,你将看 刡如何在返些 Outlets 呾 Interface Builder 中的对象(戒控件)建立连接。
 **/

@property(nonatomic, weak) IBOutlet UILabel *nameLabel;

@property(nonatomic, weak) IBOutlet UILabel *prepTimeLabel;

@property(nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
