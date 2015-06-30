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
            for(int i = 0; i<[c length]; i++){
                if(!isdigit([c characterAtIndex:i]) && [c characterAtIndex:i]!=','){
                    printf("Invalid position\nTry again: ");
                    
                    continue;
                }
            }
            NSArray *parts = [c componentsSeparatedByString:@","];
            if([parts count]!=2){
                printf("Invalid position\nTry again: ");
                
                continue;
            }
            for(int i =0; i<[parts count]; i++){
                if([parts[i] intValue]<0 || [parts[i] intValue]>=[self.board count]){
                    printf("Invalid position\nTry again: ");
                    continue;
                }
            }
            int row = [parts[0] intValue];
            int col = [parts[1] intValue];
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
    
    if(!self.twoPlayer && counter%2==0){
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
}

-(void)printBoard{
    int i = (int)[self.board count];
    NSString *dashed = @"";
    for (int l =0; l<i; l++){
        dashed =[dashed stringByAppendingString:@"--"];
    }
    for(int j =0; j<i; j++){
        for(int k=0; k<i; k++){
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
        if(j<i-1){
            printf("\n%s\n",[dashed UTF8String]);
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
