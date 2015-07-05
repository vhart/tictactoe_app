//
//  DecisionMaker.h
//  tictactoe
//
//  Created by Varindra Hart on 7/5/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "twoD.h"
@interface DecisionMaker : NSObject

@property (nonatomic) int turn;
@property (nonatomic) int colInput;
@property (nonatomic) int rowInput;
@property (nonatomic) NSString *userInput;

@property (nonatomic)twoD *board;
@property (nonatomic) BOOL twoPlayer;
@property (nonatomic) BOOL hardMode_ish;
-(BOOL)checker:(int)winVal;
-(void)makeMove:(int)counter;
-(void)makeBoard;
-(void)printBoard;
-(void)run;
-(BOOL)hasNextMove;
@end
