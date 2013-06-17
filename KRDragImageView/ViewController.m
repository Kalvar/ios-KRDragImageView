//
//  ViewController.m
//  KRDragImageView
//
//  Created by Kalvar on 13/6/17.
//  Copyright (c) 2013年 Kuo-Ming Lin. All rights reserved.
//

#import "ViewController.h"
#import "KRDragImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    KRDragImageView *_krDragImageView = [[KRDragImageView alloc] initWithImageName:@"green.png"];
    [self.view addSubview:_krDragImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
