//
//  DecisionMaker.m
//  tictactoeAlgorithm
//
//  Created by Varindra Hart on 6/29/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import "DecisionMaker.h"

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
    char holder[256];
    if(!self.twoPlayer && counter%2==1){
        printf("Your turn. Enter location seperated by a comma with no spaces: ");
        
    }
    int playerNumber = counter%2==1? 1:2;
    if(self.twoPlayer){
        printf("Player %d: Choose a position seperated by a comma (no spaces!): ",playerNumber);
    }
    if((!self.twoPlayer && counter%2==1) || self.twoPlayer){
        while(YES){
            
            scanf("%255[^\n]%*c",holder);
            fpurge(stdin);
            printf("\n");
            NSString *c = [NSString stringWithCString:holder encoding:NSASCIIStringEncoding];
            BOOL firstCheck = NO;
            for(int i = 0; i<[c length]; i++){
                if(!isdigit([c characterAtIndex:i]) && [c characterAtIndex:i]!=','){
                    printf("Invalid position\nTry again: ");
                    firstCheck=YES;
                    break;
                    //continue;
                }
            }
            if(firstCheck==YES){
                continue;
            }
            
            NSArray *parts = [c componentsSeparatedByString:@","];
            if([parts count]!=2){
                printf("Invalid position\nTry again: ");
                
                continue;
            }
            BOOL secondCheck=NO;
            for(int i =0; i<[parts count]; i++){
                if([parts[i] intValue]<1 || [parts[i] intValue]>[self.board count]){
                    printf("Invalid position\nTry again: ");
                    secondCheck=YES;
                    break;
                    //continue;
                }
            }
            
            if(secondCheck==YES){
                continue;
            }
            int row = [parts[0] intValue]-1;
            int col = [parts[1] intValue]-1;
            NSString *xo = counter%2==1? [NSString stringWithFormat:@"1"]:[NSString stringWithFormat:@"-1"];
            if([[self.board objectAtRow:row column:col] isEqualToString:@"0"]){
                [self.board setObject:xo atRow:row column:col];
                break;
            }
            else{
                printf("Position already taken\nTry again: ");
                continue;
            }
        }
    }
    
    if(!self.twoPlayer && counter%2==0 && self.hardMode_ish==NO){
        while(YES){
            int rowPC = arc4random_uniform([self.board count]);
            int colPC = arc4random_uniform([self.board count]);
            NSString *pcString = @"-1";
            if([[self.board objectAtRow:rowPC column:colPC] isEqualToString:@"0"]){
                [self.board setObject:pcString atRow:rowPC column:colPC];
                break;
            }
            else{
                continue;
            }
        }
    }
    
    if(!self.twoPlayer && counter%2==0 && self.hardMode_ish==YES){
        while(YES){
//            int rowPC = arc4random_uniform([self.board count]);
//            int colPC = arc4random_uniform([self.board count]);
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
                    if([[self.board objectAtRow:whichRow column:i] isEqualTo:@"0"]){
                        [self.board setObject:@"-1" atRow:whichRow column:i];
                    }
                }
                break;
            }
            
            if(whichCol!=-1){
                for(int i= 0; i<3; i++){
                    if([[self.board objectAtRow:i column:whichCol] isEqualToString:@"0"]){
                        [self.board setObject:@"-1" atRow:i column:whichCol];
                    }
                }
                break;
            }
            
            if(whichDiag!=-1){
                if(whichDiag==0){
                    for(int i= 0; i<3; i++){
                        if([[self.board objectAtRow:i column:i] isEqualToString:@"0"]){
                            [self.board setObject:@"-1" atRow:i column:i];
                        }
                    }
                    break;
                }
                
                if(whichDiag==2){
                    
                    for (int i= 0; i < 3; i++) {
                        if([[self.board objectAtRow:i column:whichDiag] isEqualToString:@"0"]){
                            [self.board setObject:@"-1" atRow:i column:whichDiag];
                        }
                        whichDiag--;
                    }
                    break;
                }
            }

            int rowPC = arc4random_uniform([self.board count]);
            int colPC = arc4random_uniform([self.board count]);

            NSString *pcString = @"-1";
            if([[self.board objectAtRow:rowPC column:colPC] isEqualToString:@"0"]){
                [self.board setObject:pcString atRow:rowPC column:colPC];
                break;
            }
            else{
                continue;
            }
        }
    }
}
-(void)makeBoard{
    int i;
    while(YES){
        printf("Board size: ");
        scanf("%d",&i);
        fpurge(stdin);
        if(3<=i && i<=10){
            break;
        }
    }
    TwoD *gameBoard = [[TwoD alloc] initWithRows:i columns:i];
    self.board = gameBoard;
    win = [self.board count];
    lose = -1*win;
    char singlePlayer[256];
    printf("Two Player? Answering anything other than YES or NO will default to playing the PC: ");
    scanf("%255[^\n]%*c",singlePlayer);
    NSString *c = [NSString stringWithCString:singlePlayer encoding:NSASCIIStringEncoding];
    if([c isEqualToString:@"YES"]){
        self.twoPlayer=YES;
    }
    else{
        self.twoPlayer=NO;
    }
    self.hardMode_ish=NO;
    
    if(i==3){
        printf("hardish mode?\n y/n");
        char answer[256];
        memset(answer,'\0',1);
        scanf("%255[^\n]%*c",answer);
        fpurge(stdin);
        if(answer[0]=='y'){
            self.hardMode_ish=YES;
        }
        
    }
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
    int turn =1;
    [self makeBoard];
    
    while(YES){
        [self printBoard];
        
        if(![self hasNextMove]){
            printf("TIED! I went easy on you\n");
            break;
        }
        
        [self makeMove:turn];
        if(turn%2==1){
            if([self checker:[self.board count]]){
                [self printBoard];
                if(self.twoPlayer){
                    
                    printf("\nPlayer 1 wins!");
                    break;
                }
                else{
                
                printf("I let you win.. Whatever\n");
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
                    printf("YOU LOSEE. GET OWNEDDD!");
                    break;
                }
            }
        }
        if(!self.twoPlayer && turn%2==0){
            printf("\n\n");
            usleep(1e5);
            printf("My turn! (I'm the pc)\n\n");
        }
        turn++;
        usleep(2e5);

    }
    
}





@end
