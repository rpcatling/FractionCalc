//
//  Fraction.m
//  FractionCalculator
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

@synthesize numerator, denominator;

-(Fraction *) initWith: (int)n over: (int)d {
    self = [super init];
    if (self) {
        [self setTo: n over: d];
    }
    return self;
}

-(id) init {
    return [self initWith: 0 over: 1];
}

- (BOOL) isEqual:(id)object {
    Fraction *f = (Fraction *)object;
    return numerator == f.numerator && denominator == f.denominator;
}

-(void) setTo:(int)n over:(int)d {
    numerator = n;
    denominator = d;
}

-(void) print {
    printf("%i/%i\n", numerator, denominator);
}

-(double) convertToNumber {
    return denominator ? (double)numerator/denominator : NAN;
}

-(NSString *) convertToString {
    if (numerator == denominator) {
        return numerator ? @"1" : @"0";
    } else if (denominator == 1) {
        return [NSString stringWithFormat: @"%i", numerator];
    }
    return [NSString stringWithFormat: @"%i/%i", numerator, denominator];
}

-(Fraction *) addOrSub: (Fraction *)f withSign: (BOOL)s {
    Fraction *result = [Fraction new];
    result.numerator = numerator * f.denominator + denominator * f.numerator * (s ? 1 : -1);
    result.denominator = denominator * f.denominator;
    return [result reduce];
}

-(Fraction *) add: (Fraction *)f {
    return [self addOrSub: f withSign: YES];
}

-(Fraction *)subtract:(Fraction *)f {
    return [self addOrSub: f withSign: NO];
}

-(Fraction *)multiply:(Fraction *)f {
    Fraction *result = [Fraction new];
    result.numerator = numerator * f.numerator;
    result.denominator = denominator * f.denominator;
    return [result reduce];
}

-(Fraction *)divide:(Fraction *)f {
    Fraction *result = [Fraction new];
    result.numerator = numerator * f.denominator;
    result.denominator = denominator * f.numerator;
    return [result reduce];
}

-(void) clear {
    numerator = 0;
    denominator = 1;
}


-(Fraction *) reduce {
    int u = numerator;
    int v = denominator;
    int temp;
    if (u == 0) {
        return self;
    } else if (u < 0) {
        u = -u;
    }
    while (v) {
        temp = u % v;
        u = v;
        v = temp;
    }
    numerator /= u;
    denominator /= u;
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    Fraction *f = [[Fraction allocWithZone:zone] init];
    [f setTo:numerator over: denominator];
    return f;
}

@end
