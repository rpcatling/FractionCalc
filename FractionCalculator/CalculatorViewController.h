//
//  CalculatorViewController.h
//  FractionCalculator
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFractPart;

// Numeric Keys
// each button must be connected to this method.
-(IBAction) clickDigit: (UIButton *)sender;

// Arithmetic Operation keys

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

// Other keys

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;
-(IBAction) clickConvert;

@end
