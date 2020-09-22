//
//  Node.h
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property (assign, nonatomic) int key;
@property (assign, nonatomic) int value;
@property (strong, nonatomic) Node * next;
@property (strong, nonatomic) Node * prev;
- (instancetype)initWithkey:(int)key value:(int)value;
@end

NS_ASSUME_NONNULL_END
