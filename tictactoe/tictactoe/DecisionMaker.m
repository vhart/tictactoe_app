//
//  DecisionMaker.m
//  tictactoe
//
//  Created by Varindra Hart on 7/5/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import "DecisionMaker.h"
#import "twoD.h"
@implementation DecisionMaker{
    int win ;
    int lose;
}

-(BOOL)checker:(int)winVal{
    for (int i=0;i<[self.board count];i++ ) {
        if(i==0 || i ==[self.board count]-1){
            if ([self.board diagonalSum:i]==winVal){
                return YES;
            }
        }
        if([self.board rowSum:i]==winVal || [self.board columnSum:i]==winVal){
            return YES;
        }
    }
    return NO;
}

-(void)makeMove:(int)counter{

    if(!self.twoPlayer && counter%2==1){
        printf("Your turn. Enter location seperated by a comma with no spaces: \n");
        printf("\n");
    }
    
    if((!self.twoPlayer && counter%2==1)){

            int row = self.rowInput-1;
            int col = self.colInput-1;
            NSString *xo = counter%2==1? [NSString stringWithFormat:@"1"]:[NSString stringWithFormat:@"-1"];
            if([[self.board objectAtRow:row column:col] isEqualToString:@"0"]){
                [self.board setObject:xo atRow:row column:col];
                return;
            }
            else{
                printf("Position already taken\nTry again: ");
                return;
            }
        }

    if(!self.twoPlayer && counter%2==0 && self.hardMode_ish==YES){
        while(YES){
            
            int whichRow=-1;
            int whichCol=-1;
            int whichDiag=-1;
            for(int i= 0; i<3; i++){
                if([self.board rowSum:i]==-2){
                    whichRow =i;
                    break;
                }
                if([self.board columnSum:i]==-2 ){
                    whichCol =i;
                    break;
                }
                if(i==0 || i==2) {
                    if([self.board diagonalSum:i]==-2){
                        whichDiag =i;
                        break;
                    }
                }
            }
            
            if(whichDiag==-1 && whichCol==-1 && whichRow==-1){
                for(int i= 0; i<3; i++){
                    if([self.board rowSum:i]==2){
                        whichRow =i;
                        break;
                    }
                    if([self.board columnSum:i]==2){
                        whichCol =i;
                        break;
                    }
                    if(i==0 || i==2) {
                        if([self.board diagonalSum:i]==2){
                            whichDiag =i;
                            break;
                        }
                    }
                }
            }
            
            
            if(whichRow!=-1){
                for(int i= 0; i<3; i++){
                    if([[self.board objectAtRow:whichRow column:i] isEqualToString:@"0"]){
                        [self.board setObject:@"-1" atRow:whichRow column:i];
                        self.pcMove = (3*whichRow) + i;
                        break;
                        
                    }
                }
                break;
            }
            
            if(whichCol!=-1){
                for(int i= 0; i<3; i++){
                    if([[self.board objectAtRow:i column:whichCol] isEqualToString:@"0"]){
                        [self.board setObject:@"-1" atRow:i column:whichCol];
                        self.pcMove = (3*i) + whichCol;
                        break;
                    }
                }
                break;
            }
            
            if(whichDiag!=-1){
                if(whichDiag==0){
                    for(int i= 0; i<3; i++){
                        if([[self.board objectAtRow:i column:i] isEqualToString:@"0"]){
                            [self.board setObject:@"-1" atRow:i column:i];
                            self.pcMove = (3*i) + i;
                            break;
                        }
                    }
                    break;
                }
                
                if(whichDiag==2){
                    
                    for (int i= 0; i < 3; i++) {
                        if([[self.board objectAtRow:i column:whichDiag] isEqualToString:@"0"]){
                            [self.board setObject:@"-1" atRow:i column:whichDiag];
                            self.pcMove = (3*i) + whichDiag;
                            break;
                        }
                        whichDiag--;
                    }
                    break;
                }
            }
            
            while(YES){
                int rowPC = arc4random_uniform([self.board count]);
                int colPC = arc4random_uniform([self.board count]);
                
                NSString *pcString = @"-1";
                if([[self.board objectAtRow:rowPC column:colPC] isEqualToString:@"0"]){
                    [self.board setObject:pcString atRow:rowPC column:colPC];
                    self.pcMove = (3*rowPC) + colPC;
                    break;
                }
                else{
                    continue;
                }
            }
            break;
        }
    }
}
-(void)makeBoard{
    int i=3;

    
    twoD *gameBoard = [[twoD alloc] initWithRows:i columns:i];
    self.board = gameBoard;
    win = [self.board count];
    lose = -1*win;
    

    self.output = @"";
    self.hardMode_ish = YES;
    self.twoPlayer = NO;
    self.gameOver = NO;

}


-(void)printBoard{
    int i = (int)[self.board count];
    NSString *dashed = @"";
    for (int l =0; l<i; l++){
        dashed =[dashed stringByAppendingString:@"--"];
    }
    for(int j =-1; j<i; j++){
        for(int k=-1; k<i; k++){
            if(j==-1 && k==-1)
            {
                printf("  ");
                continue;
            }
            if(j==-1){
                if(k==i-1){
                    printf("%d\n",k+1);
                }
                else{
                    printf("%d ",k+1);
                }
                continue;
            }
            if(k==-1){
                printf("%d ",j+1);
                continue;
            }
            
            int temp = [[self.board objectAtRow:j column:k]intValue];
            NSString *a = temp == 0? @" ": temp==1? @"X": @"O";
            
            if(k==i-1){
                printf("%s",[a UTF8String]);
            }
            else{
                printf("%s|",[a UTF8String]);
            }
            NSString *dashed = @"";
            dashed =[dashed stringByAppendingString:@"--"];
        }
        if(j<i-1 && j!=-1){
            printf("\n  %s\n",[[dashed substringToIndex:[dashed length]-1]UTF8String]);
        }
    }
    printf("\n\n");
}

-(BOOL)hasNextMove{
    
    for(int i = 0; i<[self.board count]; i++){
        for(int j=0; j<[self.board count]; j++){
            if([[[self.board objectAtRow:i column:j] description] isEqualToString:@"0"]){
                return YES;
            }
        }
    }
    return NO;
}


-(void)run{
    for(int i=1; i<=2; i++){
        
        
        if(![self hasNextMove]){
            self.gameOver = YES;
            self.output = [self.output stringByAppendingString:@"TIED! I went easy on you"];
            break;
            
        }
        
        [self makeMove:i];
        [self printBoard];
        if(i%2==1){
            if([self checker:[self.board count]]){
                [self printBoard];
                if(self.twoPlayer){
                    
                    printf("\nPlayer 1 wins!");
                    break;
                    
                }
                else{
                    self.gameOver = YES;
                    self.output = [self.output stringByAppendingString:@"I let you win.. Whatever"];
                    break;
                }
            }
        }
        
        else{
            if([self checker:-1*[self.board count]]){
                [self printBoard];
                if(self.twoPlayer){
                    printf("\nPlayer 2 wins!");
                    break;
                    
                }
                else{
                    self.gameOver = YES;
                    self.output =[self.output stringByAppendingString: @"YOU LOSEE. GET OWNEDDD!"];
                    break;
                    
                }
            }
        }
        if(!self.twoPlayer && i%2==1 &&[self hasNextMove]){
            printf("\n\n");
            usleep(1e5);
            printf("My turn! (I'm the pc)\n\n");
        }
    
        usleep(2e5);
        
    }
    

}

-(void)wipe{
    for(int i =0; i<3;i++){
        for(int j=0; j<3; j++){
            [self.board setObject:@"0" atRow:i column:j];
        }
    }
    self.gameOver = NO;
    self.output = [NSString stringWithFormat:@""];
}
@end
