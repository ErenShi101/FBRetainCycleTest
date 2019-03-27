//
//  ViewController.m
//  FBRetainCycleTest
//
//  Created by Eren on 2019/3/27.
//  Copyright © 2019 skyline. All rights reserved.
//

#import "ViewController.h"
#import "NXLRetainObject.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>

@interface ViewController ()
@property(nonatomic, strong) NXLRetainObject *retainObject;
@property(nonatomic, strong) UIButton *testBtn;
@property(nonatomic, strong) FBRetainCycleDetector *fbDetector;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.retainObject = [NXLRetainObject new];
    self.retainObject.vc = self;
    self.fbDetector = [FBRetainCycleDetector new];
    [self.fbDetector addCandidate:self.retainObject];
 
    
    [self.retainObject retainCycleBlock];
    self.testBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.testBtn setTitle:@"Test Leak" forState:UIControlStateNormal];
    [self.testBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.testBtn addTarget:self action:@selector(testBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testBtn];
}

- (void)testBtnClicked:(UIButton *)btn {
    NSSet *retainCycles = [self.fbDetector findRetainCycles];
    NSLog(@"%@", retainCycles);
}


@end
