//
//  LKValidatorErrorTests.m
//  InputValidatorsExample
//
//  Created by Ivan Lisovyi on 30/11/2015.
//  Copyright © 2015 Ivan Lisovyi. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "LKValidatorError.h"

@interface LKValidatorErrorTests : XCTestCase

@end

@implementation LKValidatorErrorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testThatItCanInstanceErrorWithErrorCode {
    LKValidatorErrorCode expected = LKValidatorAlphaErrorCode;
    
    NSError *error = [NSError errorWithCode:LKValidatorAlphaErrorCode];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatItHasADefaultReasonForErrorCode {
    NSError *error = [NSError errorWithCode:LKValidatorNumericErrorCode];
    XCTAssertNotNil(error.userInfo[NSLocalizedFailureReasonErrorKey]);
}

- (void)testThatItCanInstanceErrorWithCodeAndReason {
    LKValidatorErrorCode expectedCode = LKValidatorRequiredErrorCode;
    NSString *expectedReason = @"A Reason";
    
    NSError *error = [NSError errorWithCode:expectedCode reason:expectedReason];
    XCTAssertTrue(error.code == expectedCode);
    XCTAssertTrue([error.userInfo[NSLocalizedFailureReasonErrorKey] isEqualToString:expectedReason]);
}

- (void)testThatInCanInstanceUnknownError {
    LKValidatorErrorCode expected = LKValidatorUnknownErrorCode;
    
    NSError *error = [NSError unknownValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceNumericError {
    LKValidatorErrorCode expected = LKValidatorNumericErrorCode;
    
    NSError *error = [NSError numericValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceAlphaError {
    LKValidatorErrorCode expected = LKValidatorAlphaErrorCode;
    
    NSError *error = [NSError alphaValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceEmailError {
    LKValidatorErrorCode expected = LKValidatorEmailErrorCode;
    
    NSError *error = [NSError emailValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceRequiredError {
    LKValidatorErrorCode expected = LKValidatorRequiredErrorCode;
    
    NSError *error = [NSError requiredValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceLengthError {
    LKValidatorErrorCode expected = LKValidatorLengthErrorCode;
    
    NSError *error = [NSError lengthValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceRegexError {
    LKValidatorErrorCode expected = LKValidatorRegexErrorCode;
    
    NSError *error = [NSError regexValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatInCanInstanceMultipleError {
    LKValidatorErrorCode expected = LKValidatorMultipleErrorCode;
    
    NSError *error = [NSError multipleValidationError];
    XCTAssertTrue(error.code == expected);
}

- (void)testThatItCanInstanceMultipleErrorFromArrayOfErrors {
    LKValidatorErrorCode expectedCode = LKValidatorMultipleErrorCode;
    
    NSError *alphaError = [NSError alphaValidationError];
    NSError *numericalError = [NSError numericValidationError];
    
    NSString *alphaReason = alphaError.userInfo[NSLocalizedFailureReasonErrorKey];
    NSString *numericalReason = numericalError.userInfo[NSLocalizedFailureReasonErrorKey];
    NSString *expectedReason = [NSString stringWithFormat:@"%@\n%@", alphaReason, numericalReason];
    
    NSError *error = [NSError multipleValidationErrorWithErrors:@[alphaError, numericalError]];
    
    XCTAssertTrue(error.code == expectedCode);
    XCTAssertTrue([error.userInfo[NSLocalizedFailureReasonErrorKey] isEqualToString:expectedReason]);
}

@end
