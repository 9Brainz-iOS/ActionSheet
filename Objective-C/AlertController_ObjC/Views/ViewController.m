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

- (IBAction)btnShowSheetTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    NSString *strTitle = [[_txtTitle text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *strMsg = [[_txtMsg text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([strTitle isEqualToString:@""] || [strMsg isEqualToString:@""]) {

        [Utility shwoActionSheetInViewController:self withTitle:[NSString stringWithFormat:@"Empty Text"] andMessage:[NSString stringWithFormat:@"Both text required for Show this alert!"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] cancelAvailable:NO withCompletion:nil];
    } else {
        
        [Utility shwoActionSheetInViewController:self withTitle:strTitle andMessage:strMsg withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Ok"], nil] cancelAvailable:YES withCompletion:^(int index) {
            
            if (index == 0) {
                   
                NSLog(@"OK button clicked");
                // do your coding stuff here
            }
        }];
    }
}

- (IBAction)btnShowWithoutTitleTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoActionSheetInViewController:self withTitle:nil andMessage:[NSString stringWithFormat:@"Connect to the Internet"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Check Internet"], [NSString stringWithFormat:@"Not Now"], nil] cancelAvailable:YES withCompletion:^(int index) {
        
        if (index == 0) {
               
            NSLog(@"CHECK INTERNET button clicked");
            // do your coding stuff here
        } else if (index == 1) {
            
            NSLog(@"NOT NOW button clicked");
            // do your coding stuff here
        }
    }];
}

- (IBAction)btnShowWithoutMessageTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoActionSheetInViewController:self withTitle:[NSString stringWithFormat:@"Love this app! Give your important Rate about it."] andMessage:nil withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Rate Now"], [NSString stringWithFormat:@"Later"], [NSString stringWithFormat:@"No, Thanks"], nil] cancelAvailable:NO withCompletion:^(int index) {
        
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

- (IBAction)btnShowWithoutCancelTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    [Utility shwoActionSheetInViewController:self withTitle:[NSString stringWithFormat:@"Rate Us!"] andMessage:[NSString stringWithFormat:@"Provide your valuable feedback about this application!"] withButtons:[NSArray arrayWithObjects:[NSString stringWithFormat:@"Go to Store"], nil] cancelAvailable:YES withCompletion:^(int index) {
        
        if (index == 0) {
               
            NSLog(@"GO TO STORE button clicked");
            // do your coding stuff here
        }
    }];
}

- (IBAction)btnShowMulipleActionTapped:(id)sender
{
    [[self view] endEditing:YES];
    
    NSArray *weekArr = [NSArray arrayWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil];
    
    [Utility shwoActionSheetInViewController:self withTitle:[NSString stringWithFormat:@"Start Week Day"] andMessage:[NSString stringWithFormat:@"Select start week day!"] withButtons:weekArr cancelAvailable:YES withCompletion:^(int index) {
        
        if (index < weekArr.count) {
               
            NSLog(@"%@ button clicked", weekArr[index]);
            // do your coding stuff here
        }
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
