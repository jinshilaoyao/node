//
//  LFUCache.m
//  sw
//
//  Created by yao_kooleam on 2020/9/22.
//  Copyright © 2020 yao_kooleam. All rights reserved.
//

#import "LFUCache.h"
@interface LFUCache()
@property (nonatomic, assign) int cap;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, Node *> * keyToNode;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, Node *> * keyToFreq;
@property (nonatomic, assign) int count;
@property (nonatomic, strong) Node * head;
@property (nonatomic, strong) Node * tail;
@end
@implementation LFUCache
- (instancetype)initWithCap:(int)cap
{
    self = [super init];
    if (self) {
        self.cap = cap;
        self.keyToFreq = [NSMutableDictionary dictionaryWithCapacity:cap];
        self.keyToFreq = [NSMutableDictionary dictionaryWithCapacity:cap];
        self.count = 0;
        self.head = [[Node alloc] initWithkey:0 value:0];
        self.tail = [[Node alloc] initWithkey:0 value:0];
        
        self.head.next = self.tail;
        self.tail.prev = self.head;
    }
    return self;
}
- (int)get:(int)key {
    if (![self.keyToNode.allKeys containsObject:@(key) ]) {
        return -1;
    }
    Node * node = self.keyToNode[@(key)];
    [self remove:node];
    node.freq++;
    [self add:node];
    return node.value;
}
- (void)put:(int)key value:(int)value {
    if ([self.keyToNode.allKeys containsObject:@(key)]) {
        Node * node = self.keyToNode[@(key)];
        [self remove:node];
        node.freq++;
        [self add:node];
    }
    else {
        if (self.count == self.cap) {
            [self remove:self.tail.prev];
        }
        else {
            self.count++;
        }
        Node * node = [[Node alloc] initWithkey:key value:value];
        [self add:node];
    }
}

- (void)removeMinFreqKey {
    
}

- (void)remove:(Node *)node {
    node.prev.next = node.next;
    node.next.prev = node.prev;
    node.next = nil;
    
    [self.keyToNode removeObjectForKey:@(node.key)];
    
    [self.keyToFreq removeObjectForKey:@(node.freq)];
}
- (void)add:(Node *)node {
    Node * freqNode = self.keyToFreq[@(node.freq)];
    if (![node isEqual:freqNode]) {
        freqNode.prev.next = node;
        node.prev = freqNode.prev;
        node.next = freqNode;
        freqNode.prev = node;
    }
    else {
        Node * temp = self.head.next;
        while (temp.freq > node.freq && temp != self.tail) {
            temp = temp.next;
        }
        Node * prev = temp.prev;
        prev.next = node;
        node.prev = prev;
        node.next = temp;
        temp.prev = node;
    }
    
    [self.keyToFreq setValue:@(freqNode.freq) forKey:node];
    [self.keyToNode setValue:@(freqNode.key) forKey:node];
}
@end
