//
//  ViewController.m
//  UIResponderChain
//
//  Created by 林涛 on 16/7/12.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "UIScrollView+UITouch.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.tag = 10;
    UIScrollView *view = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];
    [noti postNotificationName:@"resign" object:nil];
}

@end