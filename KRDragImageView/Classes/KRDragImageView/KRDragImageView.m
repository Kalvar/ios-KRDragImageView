//
//  KRDragImageView.m
//  V0.5 Beta
//
//  Created by Kalvar ( ilovekalvar@gmail.com ) on 13/6/17.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import "KRDragImageView.h"

@interface KRDragImageView (fixPrivate)

-(void)_initWithVars;
-(UIImage *)_imageNoCacheWithName:(NSString *)_imageName;

@end

@implementation KRDragImageView (fixPrivate)

-(void)_initWithVars
{
    
}

-(UIImage *)_imageNoCacheWithName:(NSString *)_imageName
{
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] bundlePath], _imageName]];
}

@end

@implementation KRDragImageView

@synthesize nowPoints  = _nowPoints;

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _initWithVars];
    }
    return self;
}

-(id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
	if ( self )
    {
        self.userInteractionEnabled = YES;
        [self _initWithVars];
    }
	return self;
}

-(KRDragImageView *)initWithImageName:(NSString *)_imageName
{
    return [self initWithImage:[self _imageNoCacheWithName:_imageName]];
}

#pragma --mark Methods
-(void)resetImage:(UIImage *)_image
{
    self.image = _image;
    self.userInteractionEnabled = YES;
}

#pragma --mark Touches
/*
 * @ Start Dragging
 */
-(void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	self.nowPoints = [[touches anyObject] locationInView:self];
}

/*
 * @ Keep Moving
 */
-(void) touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
	CGPoint _touchedPoints = [[touches anyObject] locationInView:self];
	CGPoint _newPoints     = CGPointMake(self.center.x + (_touchedPoints.x - _nowPoints.x),
                                         self.center.y + (_touchedPoints.y - _nowPoints.y));
    CGFloat _midX = CGRectGetMidX(self.bounds);
	CGFloat _midY = CGRectGetMidY(self.bounds);
    CGSize _superviewBoundsSize = self.superview.bounds.size;
    //If the image is far away from the side of right. ( 離右邊太遠 )
    if (_newPoints.x > _superviewBoundsSize.width  - _midX)
    {
        _newPoints.x = _superviewBoundsSize.width - _midX;
    }
    else if (_newPoints.x < _midX)
    {
        //如果離左邊太遠
        _newPoints.x = _midX;
    }
    //If it's too far away from the bottom. ( 離下面太遠 )
	if (_newPoints.y > _superviewBoundsSize.height  - _midY)
    {
        _newPoints.y = _superviewBoundsSize.height - _midY;
    }
    else if (_newPoints.y < _midY)
    {
        _newPoints.y = _midY;
    }
	//Set the new center location up ( 將圖片設定在新的位子上 )
	self.center = _newPoints;
}

@end
