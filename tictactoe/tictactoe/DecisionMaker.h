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

@property (nonatomic) int mid1_i;
@property (nonatomic) int mid1_j;
@property (nonatomic) int mid2_i;
@property (nonatomic) int mid2_j;
@property (nonatomic) BOOL mid1;
@property (nonatomic) BOOL mid2;
@property (nonatomic) BOOL corner1;
@property (nonatomic) BOOL corner2;
@property (nonatomic) BOOL center;

@property (nonatomic) int turn;
@property (nonatomic) int colInput;
@property (nonatomic) int rowInput;
@property (nonatomic) NSString *userInput;
@property (nonatomic) NSString *output;
@property (nonatomic) int pcMove;
@property (nonatomic) int turnNumber;

@property (nonatomic) BOOL gameOver;
@property (nonatomic)twoD *board;
@property (nonatomic) BOOL twoPlayer;
@property (nonatomic) BOOL hardMode_ish;

-(BOOL)checker:(int)winVal;
-(void)makeMove:(int)counter;
-(void)makeBoard;
-(void)printBoard;
-(void)run;
-(BOOL)hasNextMove;
-(void)determineCenterMiddleOrCornerRow:(int)row Column:(int)col;
-(void)wipe;
@end
