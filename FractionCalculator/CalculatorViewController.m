//
//  CalculatorViewController.m
//  FractionCalculator
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//

#import "CalculatorViewController.h"
#import "Calculator.h"

#define UNSET_OP '!'

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController {
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    displayString = [NSMutableString stringWithCapacity: 40];
    [self resetState];
    myCalculator = [Calculator new];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// navigation state ...

-(void)readyForFirstFraction {
    isNumerator = YES;
    firstOperand = YES;
}

-(void)readyForNextFraction {
    firstOperand = NO;
    isNumerator = YES;
}

-(void)readyForDenominator {
    isNumerator = NO;
}

// done with navigation state

-(void) display: (NSString *)txt {
    [displayString appendString: txt];
    display.text = displayString;
}

-(void) processDigit:(int)digit {
    currentNumber = currentNumber * 10 + digit;
    [self display: [NSString stringWithFormat: @"%i", digit]];
}

-(IBAction) clickDigit:(UIButton *)sender {
    [self processDigit: sender.tag];
}

// this doesn't actually perform the operation, just displays it, and
// saves it. Its not until = is clicked that the operation is performed.
-(void)processOp:(char)theOp {
    if (op != UNSET_OP) {
        return;     // this calculator can only accept one operation!
    }
    NSString *opStr;
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    [self storeFractPart];
    [self readyForNextFraction];
    [self display: opStr];
}

-(void) storeFractPart {
    Fraction *operand = firstOperand ? myCalculator.operand1 : myCalculator.operand2;
    if (isNumerator) {
        operand.numerator = currentNumber;
    } else {
        operand.denominator = currentNumber;
    }
    currentNumber = 0;
}

-(IBAction) clickOver {
    [self storeFractPart];
    [self readyForDenominator];
    [self display: @"/"];
}

// Arithmetic operation keys ...

-(IBAction) clickPlus { [self processOp:'+']; }
-(IBAction) clickMinus { [self processOp:'-']; }
-(IBAction) clickMultiply { [self processOp:'*']; }
-(IBAction) clickDivide { [self processOp:'/']; }

// Other keys ...

-(IBAction) clickEquals {
    if (!firstOperand) {
        [self storeFractPart];
        [myCalculator performOperation:op];
        [displayString appendString:@" = "];
        [self display:[myCalculator.accumulator convertToString]];
        [self resetState];
    }
}

-(IBAction) clickClear {
    [self resetState];
    [myCalculator clear];
    [self display: @""];
}

-(void) resetState {
    [self readyForFirstFraction];
    currentNumber = 0;
    [displayString setString: @""];
    op = UNSET_OP;
}

-(IBAction) clickConvert {
    printf("Convert clicked!!\n");
    // first make sure there is a result
    if (currentNumber) {
        if (firstOperand) {
            [self storeFractPart];
            [myCalculator performOperation:'+'];    // just puts first value in acc.
        } else {
            [self clickEquals];
        }
    }
    // now display result
    [displayString setString: @""];
    double num = [myCalculator.accumulator convertToNumber];
    NSString *s = [NSString stringWithFormat:@"%f", num];
    [self display: s];
    [self resetState];
}

@end
