//
//  Utility.m
//  AlertController_ObjC
//
//  Created by Hardik Trivedi on 06/11/19.
//  Copyright © 2019 9Brainz. All rights reserved.
//

#import "Utility.h"

@implementation Utility

//
//    // INPUT Parameter
//
//    // vc       : ViewController (in which you want to display Alert)
//    // title    : Title text of AlertController
//    // message  : Message text of AlertController
//    // button   : Multiple buttons for AlertController
//

+ (void)
shwoAlertControllerInViewController: (UIViewController *)vc withTitle: (nullable NSString *)title andMessage: (nullable NSString *)message withButtons: (NSArray *)button withCompletion: (completion)completionBlock
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    for (int index = 0; index < button.count; index++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:button[index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            if (completionBlock != nil) {

                completionBlock(index);
            }
        }];
        
        [alertController addAction:action];
    }
    
    [vc presentViewController:alertController animated:YES completion:nil];
}

@end
