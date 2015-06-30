//
//  DecisionMaker.h
//  tictactoeAlgorithm
//
//  Created by Varindra Hart on 6/29/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TwoD.h"
@interface DecisionMaker : NSObject
@property (nonatomic)TwoD *board;
@property (nonatomic) BOOL twoPlayer;
-(BOOL)checker:(int)winVal;
-(void)makeMove:(int)counter;
-(void)makeBoard;
-(void)printBoard;
-(void)run;
-(BOOL)hasNextMove;
@end
