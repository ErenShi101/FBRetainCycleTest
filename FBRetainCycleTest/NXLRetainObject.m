//
//  NXLRetainObject.m
//  FBRetainCycleTest
//
//  Created by Eren on 2019/3/27.
//  Copyright © 2019 skyline. All rights reserved.
//

#import "NXLRetainObject.h"

@implementation NXLRetainObject
- (void)retainCycleBlock {
    self.myBlock = ^{
        NSLog(@"Self address is %p", self);
    };
}

- (void)dealloc {
    NSLog(@"NXLRetainObject object released");
}
@end
