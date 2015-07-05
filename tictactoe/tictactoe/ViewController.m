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
@property (weak, nonatomic) IBOutlet UILabel *label11;
@property (weak, nonatomic) IBOutlet UILabel *label12;
@property (weak, nonatomic) IBOutlet UILabel *label13;
@property (weak, nonatomic) IBOutlet UILabel *label21;
@property (weak, nonatomic) IBOutlet UILabel *label22;
@property (weak, nonatomic) IBOutlet UILabel *label23;
@property (weak, nonatomic) IBOutlet UILabel *label31;
@property (weak, nonatomic) IBOutlet UILabel *label32;
@property (weak, nonatomic) IBOutlet UILabel *label33;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRowInfo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldColumnInfo;
@property (nonatomic) int rowInfo;
@property (nonatomic) int colInfo;
@property (nonatomic)DecisionMaker *board;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    DecisionMaker *dm = [[DecisionMaker alloc] init];
    self.board = dm;
    [self.board makeBoard];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)Go:(id)sender {
//    self.rowInfo=[self.textFieldRowInfo.text intValue];
//    self.colInfo=[self.textFieldColumnInfo.text intValue];
    

    int i = [self.textFieldRowInfo.text intValue];
    self.board.rowInput = i;
    int k = [self.textFieldColumnInfo.text intValue];
    self.board.colInput = k;
    self.board.turn=1;
    [self.board run];
    self.label11.text = [@"0" isEqualToString:[self.board.board objectAtRow:0 column:0]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:0 column:0]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label12.text = [@"0" isEqualToString:[self.board.board objectAtRow:0 column:1]]? [NSString stringWithFormat:@"%@",@" "] :( [@"1" isEqualToString:[self.board.board objectAtRow:0 column:1]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label13.text = [@"0" isEqualToString:[self.board.board objectAtRow:0 column:2]]? [NSString stringWithFormat:@"%@",@" "] :( [@"1" isEqualToString:[self.board.board objectAtRow:0 column:2]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label21.text = [@"0" isEqualToString:[self.board.board objectAtRow:1 column:0]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:1 column:0]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label22.text = [@"0" isEqualToString:[self.board.board objectAtRow:1 column:1]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:1 column:1]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label23.text = [@"0" isEqualToString:[self.board.board objectAtRow:1 column:2]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:1 column:2]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label31.text = [@"0" isEqualToString:[self.board.board objectAtRow:2 column:0]]? [NSString stringWithFormat:@"%@",@" "] :( [@"1" isEqualToString:[self.board.board objectAtRow:2 column:0]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label32.text = [@"0" isEqualToString:[self.board.board objectAtRow:2 column:1]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:2 column:1]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
    
    self.label33.text = [@"0" isEqualToString:[self.board.board objectAtRow:2 column:2]]? [NSString stringWithFormat:@"%@",@" "] : ([@"1" isEqualToString:[self.board.board objectAtRow:2 column:2]]? [NSString stringWithFormat:@"%@",@"X"] :[NSString stringWithFormat:@"%@",@"O"]);
}

@end
