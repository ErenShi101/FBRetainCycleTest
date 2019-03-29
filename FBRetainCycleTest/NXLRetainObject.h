//
//  NXLRetainObject.h
//  FBRetainCycleTest
//
//  Created by Eren on 2019/3/27.
//  Copyright © 2019 skyline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^blockType)(void);
@interface NXLRetainObject : NSObject

@property(nonatomic, strong) UIViewController *vc;
@property(nonatomic, strong) blockType myBlock;
@property(nonatomic, weak) NSNumber *age;
@property(nonatomic, strong) NSString *name;

- (void)retainCycleBlock;
@end

NS_ASSUME_NONNULL_END
