//
//  ViewController.m
//  tictactoe
//
//  Created by Varindra Hart on 7/4/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import "ViewController.h"
#import "DecisionMaker.h"
#import "twoD.h"

@interface ViewController ()


@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *buttons;


@property (nonatomic)DecisionMaker *board;
@property (nonatomic) int counter;
-(void)setBlank;
//- (void)printBoard;
//- (void)checkBoard;
@end

@implementation ViewController
-(void) setBlank{
    for (int i =0; i<9; i++){
        [self.buttons[i] setTitle:@" " forState:normal];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DecisionMaker *dm = [[DecisionMaker alloc] init];
    self.board = dm;
    [self.board makeBoard];
    [self setBlank];
//    self.board.output=@"";
//    self.outputLabel.text= @"";
    
}

- (IBAction)buttonClicked:(UIButton *)sender {
    if([sender.currentTitle isEqualToString:@" "]){
        NSUInteger index = [self.buttons indexOfObject:sender];
        int row = (int)(index / 3)+1;
        int col = (int)(index % 3)+1;
        
//        [self.board makeMoveAtRow:row andColumn:column];
//        [self.board makeMove:@[row, col]];
        
        self.board.rowInput=row;
        self.board.colInput=col;
        self.board.turn = 1;
        [self.board run];
        [sender setTitle:@"X" forState:normal];
        [self.buttons[self.board.pcMove] setTitle:@"O" forState:normal];
        if(self.board.gameOver){
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:[NSString stringWithFormat:@"%@\nPress Start for a new game!",self.board.output] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defOk = [UIAlertAction actionWithTitle:@"Start" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                [self setBlank];
                [self.board wipe];
            }];
            UIAlertAction *defQuit = [UIAlertAction actionWithTitle:@"Quit" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                exit(0);
            }];
            [alert addAction:defOk];
            [alert addAction:defQuit];
            [self presentViewController:alert animated:YES completion:nil];
//            
//                                        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"My Alert"
//                                                                           message:@"This is an alert."
//                                                                    preferredStyle:UIAlertControllerStyleAlert];
//            
//            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
//                                                                  handler:^(UIAlertAction * action) {}];
//            
//            [alert addAction:defaultAction];
//            [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    
    }
}


- (IBAction)Go:(id)sender {
    
    if([self.board.output isEqualToString:@""]){
        
    }
}
@end
