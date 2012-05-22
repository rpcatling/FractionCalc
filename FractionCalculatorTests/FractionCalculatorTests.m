//
//  FractionCalculatorTests.m
//  FractionCalculatorTests
//
//  Created by Robert Catling on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FractionCalculatorTests.h"
#import "Fraction.h"

@implementation FractionCalculatorTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    // OK
    // STFail(@"Unit tests are not implemented yet in FractionCalculatorTests");
}

-(void) testPrint {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    [f print];
}

-(void) testClear {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *expected = [[Fraction alloc] initWith: 0 over: 1];
    [f clear];
    STAssertEqualObjects(expected, f, @"clear should 0");
}

-(void)testReduce {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *f2 = [[Fraction alloc] initWith: 2 over: 4];
    STAssertEqualObjects(f, f2.reduce, @"2/4 should be 1/2");
}

-(void)testReduceInt {
    Fraction *f = [[Fraction alloc] initWith: 5 over: 1];
    STAssertEqualObjects(f, f.reduce, @"integer reduce should be same");
}

-(void) testAdd {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *f2 = [[Fraction alloc] initWith: 1 over: 4];
    Fraction *expectedTotal = [[Fraction alloc] initWith: 3 over: 4];
    
    STAssertEqualObjects(expectedTotal, [f add: f2], @"1/2 + 1/4 should be 3/4");    
}

-(void) testSubtract {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *f2 = [[Fraction alloc] initWith: 1 over: 4];
    Fraction *expected = [[Fraction alloc] initWith: 1 over: 4];
    
    STAssertEqualObjects(expected, [f subtract: f2], @"1/2 - 1/4 should be 1/4");    
}

-(void) testMultiply {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *f2 = [[Fraction alloc] initWith: 3 over: 4];
    Fraction *expected = [[Fraction alloc] initWith: 3 over: 8];
    
    STAssertEqualObjects(expected, [f multiply: f2], @"1/2 * 3/4 should be 3/8");        
}

-(void) testMultiplyInts {
    Fraction *f = [Fraction new]; f.numerator = 2;
    Fraction *f2 = [Fraction new]; f2.numerator = 5;
    Fraction *expected = [[Fraction alloc] initWith: 10 over: 1];
    Fraction *result = [f multiply: f2];
//    
//    [f print];
//    [f2 print];
//    [expected print];
//    [result print];
    
    STAssertEqualObjects(expected, result, @"2 * 5 should be 10");        
}

-(void) testDivide {
    Fraction *f = [[Fraction alloc] initWith: 1 over: 2];
    Fraction *f2 = [[Fraction alloc] initWith: 3 over: 4];
    Fraction *expected = [[Fraction alloc] initWith: 2 over: 3];
    
    STAssertEqualObjects(expected, [f divide: f2], @"1/2 / 3/4 should be 2/3");            
}


@end
