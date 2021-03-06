//
//  ViewController.m
//  KVOTest
//
//  Created by 林涛 on 16/3/3.
//  Copyright © 2016年 limaofuyuanzhang. All rights reserved.
//

#import "ViewController.h"
#import "StockData.h"

@interface ViewController (){
    StockData *stockForKVO;
    UILabel *myLabel;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super viewDidLoad];
    myLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30 )];
    myLabel.textColor = [UIColor redColor];
    [self.view addSubview:myLabel];
    
    stockForKVO = [[StockData alloc] init];
    [stockForKVO setValue:@"searph" forKey:@"stockName"];
    [stockForKVO setValue:@10.0 forKey:@"price"];
    [stockForKVO addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionNew context:NULL];
    

    
    UIButton * b = [[UIButton alloc] initWithFrame:CGRectMake(40, 40, 100, 30)];
    [b setTitle:@"点击我" forState:UIControlStateNormal];
    b.titleLabel.backgroundColor = [UIColor blackColor];
    [b addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b];
    
}

-(void) buttonAction{
    [stockForKVO setValue:@20.0 forKey:@"price"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //根据path可以直接得到新值，而change可以得到更多信息
    if([keyPath isEqualToString:@"price"]){
        myLabel.text = [NSString stringWithFormat:@"%@",[stockForKVO valueForKey:@"price"]];
        NSLog(@"%@",[stockForKVO valueForKey:@"price"]);
        
        NSLog(@"%@",change);
    }
}

@end
