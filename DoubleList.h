//
//  DoubleList.h
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoubleList : NSObject
- (void)addLast:(Node *)node;
- (void)remove:(Node *)node;
- (Node *)removeFirst;
- (int)size;
@end

NS_ASSUME_NONNULL_END
