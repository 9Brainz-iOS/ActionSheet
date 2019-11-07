//
//  Utility.swift
//  ActionSheet_Swift
//
//  Created by Hardik Trivedi on 07/11/19.
//  Copyright © 2019 9Brainz. All rights reserved.
//

import UIKit

class Utility: NSObject
{
    
    // INPUT Parameter
    
    // vc       : ViewController (in which you want to display Alert)
    // title    : Title text of AlertController
    // message  : Message text of AlertController
    // button   : Multiple buttons for AlertController
    
    static func shwoActionSheetInViewController(vc: UIViewController, withTitle title: String?, andMessage message: String?, withButtons button: [String], cancelAvailable isCancel: Bool, completion:((_ index: Int) -> Void)!) -> Void
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)

        for index in 0 ..< button.count  {

            let action = UIAlertAction(title: button[index], style: .default, handler: { (alert: UIAlertAction!) in

                if completion != nil {

                    completion(index)
                }
            })

            alertController.addAction(action)
        }
        
        if isCancel {
            
            let action = UIAlertAction(title: "Cancel", style: .destructive, handler: { (alert: UIAlertAction!) in

                if completion != nil {

                    completion(button.count)
                }
            })

            alertController.addAction(action)
        }
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone) {

            // if device is iPhone
            vc.present(alertController, animated: true, completion: nil)
        } else {
            
            // if device is iPad
            alertController.modalPresentationStyle = .popover

            if let popoverController = alertController.popoverPresentationController {
                
                popoverController.sourceView = vc.view
                popoverController.sourceRect = CGRect(x: vc.view.bounds.midX, y: vc.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }
        }
    }

}
