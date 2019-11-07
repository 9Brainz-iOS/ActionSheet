//
//  Utility.h
//  AlertController_ObjC
//
//  Created by Hardik Trivedi on 06/11/19.
//  Copyright © 2019 9Brainz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utility : NSObject

typedef void (^ _Nullable completion)(int index);

+ (void)
shwoAlertControllerInViewController: (UIViewController *)vc withTitle: (nullable NSString *)title andMessage: (nullable NSString *)message withButtons: (NSArray *)button withCompletion: (completion)completionBlock;

@end

NS_ASSUME_NONNULL_END
