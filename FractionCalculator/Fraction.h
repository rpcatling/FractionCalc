//
//  Fraction.h
//  FractionCalculator
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Fraction : NSObject <NSCopying>

@property int numerator, denominator;

-(Fraction *) initWith: (int)n over: (int)d;
-(void) print;
-(void) setTo: (int)n over: (int)d;
-(Fraction *) add: (Fraction *)f;
-(Fraction *) subtract: (Fraction *)f;
-(Fraction *) multiply: (Fraction *)f;
-(Fraction *) divide: (Fraction *)f;
-(Fraction *) reduce;
-(double) convertToNumber;
-(NSString *) convertToString;
-(void) clear;

@end
