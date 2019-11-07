//
//  ViewController.m
//  AlertController_ObjC
//
//  Created by Hardik Trivedi on 06/11/19.
//  Copyright © 2019 9Brainz. All rights reserved.
//

#import "ViewController.h"
#import "Utility.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (IBAction)btnShowAlertTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    NSString *strTitle = [[_txtTitle text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *strMsg = [[_txtMsg text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([strTitle isEqualToString:@""] || [strMsg isEqualToString:@""]) {

        [Utility shwoAlertControllerInViewController:self withTitle:[NSString stringWithFormat:@"Empty Text"] andMessage:[NSString stringWithFormat:@"Both text required for Show this alert!"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] withCompletion:nil];
    } else {
        
        [Utility shwoAlertControllerInViewController:self withTitle:strTitle andMessage:strMsg withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] withCompletion:^(int index) {
               
            if (index == 0) {
                   
                NSLog(@"OK button clicked");
                // do your coding stuff here
            }
        }];
    }
}

- (IBAction)btnShowWithTwoAlertTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoAlertControllerInViewController:self withTitle:[NSString stringWithFormat:@"Two Button"] andMessage:[NSString stringWithFormat:@"Are you sure?"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"No"], [NSString stringWithFormat:@"Yes"], nil] withCompletion:^(int index) {
        
        if (index == 0) {
            
            NSLog(@"NO button clicked");
            // do your coding stuff here
        } else if (index == 1) {
            
            NSLog(@"YES button clicked");
            // do your coding stuff here
        }
    }];
}

- (IBAction)btnShowWithThreeAlertTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoAlertControllerInViewController:self withTitle:[NSString stringWithFormat:@"Three Button"] andMessage:[NSString stringWithFormat:@"Love this app! Give your important Rate about it."] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Rate Now"], [NSString stringWithFormat:@"Later"], [NSString stringWithFormat:@"No, Thanks"], nil] withCompletion:^(int index) {
        
        if (index == 0) {
            
            NSLog(@"RATE NOW button clicked");
            // do your coding stuff here
        } else if (index == 1) {
            
            NSLog(@"LATER button clicked");
            // do your coding stuff here
        } else if (index == 2) {
            
            NSLog(@"NO THANKS button clicked");
            // do your coding stuff here
        }
    }];
}

- (IBAction)btnAlertWithTitleTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoAlertControllerInViewController:self withTitle:[NSString stringWithFormat:@"No Internet Connection"] andMessage:nil withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] withCompletion:nil];
}

- (IBAction)btnAlertWithMsgTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoAlertControllerInViewController:self withTitle:nil andMessage:[NSString stringWithFormat:@"Task complete successfully!"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] withCompletion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
