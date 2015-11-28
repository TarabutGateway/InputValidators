//
//  MultipleValidatorExampleViewController.h
//  InputValidatorsExample
//
//  Created by Ivan Lisovyi on 07.11.13.
//  Copyright (c) 2015 Ivan Lisovyi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MultipleValidatorsType) {
    ValidatorTypeRequiredAndEmail = 0,
    ValidatorTypeRequiredAndAlpha,
    ValidatorTypeRequiredAndNumeric,
};


@interface MultipleValidatorExampleViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, assign) MultipleValidatorsType validatorsType;

@end
