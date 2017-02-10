//
//  ViewController.m
//  LLGridView
//
//  Created by zdy on 2017/2/10.
//  Copyright © 2017年 lianlian. All rights reserved.
//

#import "ViewController.h"
#import "LLGridView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *columns = @[@"期次",@"还款日",@"应还本息(元)",@"本金(元)",@"利息(元)"];
    NSArray *rows = @[@[@"1",@"2017-02-15",@"1741.25",@"16858.33",@"82.92"],
                      @[@"2",@"2017-02-15",@"1741.25",@"16858.33",@"82.92"],
                      @[@"3",@"2017-02-15",@"1741.25",@"16858.33",@"82.92"],
                      @[@"4",@"2017-02-15",@"1741.25",@"16858.33",@"82.92"]];
    CGFloat h = 24+25*rows.count;
    CGFloat w = CGRectGetWidth(self.view.bounds);
    
    LLGridView *gridView = [[LLGridView alloc] initWithFrame:CGRectMake(12, 100, w-24, h)];
    gridView.backgroundColor = [UIColor whiteColor];
    gridView.borderColor = [UIColor grayColor];
    gridView.textColor = [UIColor blackColor];
    gridView.columns = columns;
    gridView.rows = rows;
    [self.view addSubview:gridView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
