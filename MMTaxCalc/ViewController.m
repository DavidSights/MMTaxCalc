//
//  ViewController.m
//  MMTaxCalc
//
//  Created by David Seitz Jr on 5/7/15.
//  Copyright (c) 2015 DavidSights. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *myController;
@property float caTax, chiTax, nyTax;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *yourCalculatedLabel;

@end

@implementation ViewController
- (IBAction)calculateTaxButton:(id)sender {
    float numberResult;
    switch (_myController.selectedSegmentIndex) {
        case -1: {
            NSLog(@"Calculate Tax button pressed, but nothing happened because no city was selected.");
            UIAlertController* pickSomethingAlert = [UIAlertController alertControllerWithTitle:@"Pick a city"
                                                                           message:@"Select the city you'd like to calculate tax for."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];

            [pickSomethingAlert addAction:defaultAction];
            [self presentViewController:pickSomethingAlert animated:YES completion:nil];
        }
            break;

        case 0:
            NSLog(@"Calculated tax for CA.");
            numberResult = [self.myTextField.text floatValue] * _caTax;
            _resultLabel.text = [NSString stringWithFormat:@"%.02f", numberResult];

            //DEBUG INFO
            //NSLog(@"self.myTextField.text = %i", [self.myTextField.text integerValue]);
            //NSLog(@"self.caTax = %f", self.caTax);
            //NSLog(@"numberResult = %f", numberResult);
            break;

        case 1:
            NSLog(@"Calculated tax for CHI.");
            numberResult = [self.myTextField.text floatValue] * _chiTax;
            _resultLabel.text = [NSString stringWithFormat:@"%.02f", numberResult];

            break;

        case 2:
            NSLog(@"Calculated tax for NY.");
            numberResult = [self.myTextField.text floatValue] * _nyTax;
            _resultLabel.text = [NSString stringWithFormat:@"%.02f", numberResult];

            break;

        default:nil;
            break;
    }

    if (self.myController.selectedSegmentIndex != -1) {
        self.yourCalculatedLabel.alpha = 1;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _caTax = 0.075;
    _chiTax = 0.0925;
    _nyTax = 0.045;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
