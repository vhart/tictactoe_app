//
//  twoD.m
//  
//
//  Created by Varindra Hart on 7/5/15.
//
//

#import "twoD.h"

@implementation twoD{
    int count;
    
}
-(instancetype)initWithRows:(int)rows columns:(int)columns{
    if(self =[self init]){
        Rows = [[NSMutableArray alloc] initWithCapacity:rows];
        for(int i=0; i < columns; i++){
            NSMutableArray *a = [NSMutableArray arrayWithCapacity:columns];
            [Rows insertObject:a atIndex:i];
            for(int j=0; j<columns;j++){
                [a insertObject:@"0" atIndex:j];
            }
            [Rows insertObject:a atIndex:i];
        }
    }
    count = rows;
    return self;
}
-(int)count{
    return count;
}
-(id)objectAtRow:(int)row column:(int)column{
    return [[Rows objectAtIndex:row] objectAtIndex:column];
}
-(void)setObject:(NSString *)object atRow:(int)row column:(int)column{
    [[Rows objectAtIndex:row] replaceObjectAtIndex:column withObject:object];
}

-(int)rowSum:(int)rowNumber{
    int sum=0;
    for(int i=0; i< count; i++){
        sum+=[[self objectAtRow:rowNumber column:i] intValue];
    }
    return sum;
}

-(int)columnSum:(int)columnNumber{
    int sum=0;
    for(int i=0; i <count; i++){
        sum+=[[self objectAtRow:i column:columnNumber] intValue];
    }
    return sum;
}

-(int)diagonalSum:(int)topCorner{
    int sum=0;
    int val = topCorner;
    for (int i= 0; i < count; i++) {
        if(topCorner == count-1){
            sum+=[[self objectAtRow:i column:val] intValue];
            val--;
        }
        if(topCorner==0){
            sum+=[[self objectAtRow:i column:i] intValue];
        }
    }
    return sum;
}

@end

