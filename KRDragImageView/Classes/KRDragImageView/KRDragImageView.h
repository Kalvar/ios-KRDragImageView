//
//  KRDragImageView.h
//  V0.5 Beta
//
//  Created by Kalvar ( ilovekalvar@gmail.com ) on 13/6/17.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRDragImageView : UIImageView
{
    CGPoint firePoints;
}

@property (nonatomic, assign) CGPoint nowPoints;

-(KRDragImageView *)initWithImageName:(NSString *)_imageName;
-(void)resetImage:(UIImage *)_image;

@end
