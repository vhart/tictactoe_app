//
//  twoD.h
//  
//
//  Created by Varindra Hart on 7/5/15.
//
//

#import <Foundation/Foundation.h>


@interface twoD : NSObject{
    NSMutableArray *Rows;
}
-(instancetype)initWithRows:(int)rows columns:(int)columns;
-(id)objectAtRow:(int)row column:(int)column;
-(void)setObject:(NSString *)object atRow:(int)row column:(int)column;
-(int)count;
-(int)rowSum:(int)rowNumber;
-(int)columnSum:(int)columnNumber;
-(int)diagonalSum:(int)topCorner;

@end

