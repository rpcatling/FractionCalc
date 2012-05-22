//
//  Calculator.m
//  FractionCalculator
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand1, operand2, accumulator;

-(id) init {
    self = [super init];
    if (self) {
        operand1 = [Fraction new];
        operand2 = [Fraction new];
        accumulator = [Fraction new];
    }
    return self;
}

-(void) clear {
    [operand1 clear];
    [operand2 clear];
    [accumulator clear];
}

-(Fraction *)performOperation:(char)op {
    Fraction *result;
    switch (op) {
            case '+':
                result = [operand1 add: operand2];
                break;
            case '-':
                result = [operand1 subtract: operand2];
                break;
            case '*':
                result = [operand1 multiply: operand2];
                break;
            case '/':
                result = [operand1 divide: operand2];
                break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    
    return accumulator;
}

@end
