//
//  UITableViewCell+SAMExtension.m
//  Demo
//
//  Created by samiMac on 16/3/11.
//  Copyright © 2016年 wydatas. All rights reserved.
//

#import "UITableViewCell+SAMExtension.h"
#import "UIImage+SAMExtension.h"

@implementation UITableViewCell (SAMExtension)


-(void)setDefaultColor:(UIColor *)_color
{
    UIImage *image = [UIImage image4ContextWithColor:_color size:CGSizeMake(self.frame.size.width,self.frame.size.height)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.backgroundView = imageView;
    self.backgroundColor = _color;
    
}

-(void)setSelectedColor:(UIColor *)_color
{
    UIImage *image = [UIImage image4ContextWithColor:_color size:CGSizeMake(self.frame.size.width,self.frame.size.height)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    self.selectedBackgroundView = imageView;
    self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
}



@end
