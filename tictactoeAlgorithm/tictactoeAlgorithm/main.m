//
//  main.m
//  tictactoeAlgorithm
//
//  Created by Varindra Hart on 6/29/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DecisionMaker.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        DecisionMaker *c = [[DecisionMaker alloc] init];
        [c run];
    }
    return 0;
}
