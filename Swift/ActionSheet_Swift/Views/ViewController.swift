//
//  ViewController.swift
//  ActionSheet_Swift
//
//  Created by Hardik Trivedi on 07/11/19.
//  Copyright © 2019 9Brainz. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtMsg: UITextField!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnShowSheetTapped(_ sender: Any)
    {
        self.view.endEditing(true)
        
        let strTitle: String = (self.txtTitle.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!
        let strMsg: String = (self.txtMsg.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!
        
        if strTitle == "" || strMsg == "" {
            
            Utility.shwoActionSheetInViewController(vc: self, withTitle: "Empty Text", andMessage: "Both text required for Show this actionsheet!", withButtons: ["Ok"], cancelAvailable: false, completion: nil)
        } else {
            
            Utility.shwoActionSheetInViewController(vc: self, withTitle: strTitle, andMessage: strMsg, withButtons: ["Ok"], cancelAvailable: true) { (intIndex) in
                
                if intIndex == 0 {
                    
                    print("OK button clicked")
                    // do your coding stuff here
                }
            }
        }
    }
    
    @IBAction func btnShowWithoutTitleTapped(_ sender: Any)
    {
        self.view.endEditing(true)
        
        Utility.shwoActionSheetInViewController(vc: self, withTitle: nil, andMessage: "Connect to the Internet", withButtons: ["Check Internet", "Not Now"], cancelAvailable: true) { (intIndex) in
            
            if intIndex == 0 {
                
                print("CHECK INTERNET button clicked")
                // do your coding stuff here
            } else if intIndex == 1 {
                
                print("NOT NOW button clicked")
                // do your coding stuff here
            }
        }
    }
    
    @IBAction func btnShowWithoutMessageTapped(_ sender: Any)
    {
        self.view.endEditing(true)
        
        Utility.shwoActionSheetInViewController(vc: self, withTitle: "Love this app! Give your important Rate about it.", andMessage: nil, withButtons: ["Rate Now", "Later", "No, Thanks"], cancelAvailable: false) { (intIndex) in
            
            if intIndex == 0 {
                
                print("RATE NOW button clicked")
                // do your coding stuff here
            } else if intIndex == 1 {
                
                print("LATER button clicked")
                // do your coding stuff here
            } else if intIndex == 2 {
                           
                print("NO THANKS button clicked")
                // do your coding stuff here
            }
        }
    }
    
    @IBAction func btnShowWithoutCancelTapped(_ sender: Any)
    {
        self.view.endEditing(true)
        
        Utility.shwoActionSheetInViewController(vc: self, withTitle: "Rate Us!", andMessage: "Provide your valuable feedback about this application!", withButtons: ["Go to Store"], cancelAvailable: false) { (intIndex) in
            
            if intIndex == 0 {
                
                print("GO TO STORE button clicked")
                // do your coding stuff here
            }
        }
    }
    
    @IBAction func btnShowMulipleActionTapped(_ sender: Any)
    {
        self.view.endEditing(true)
        
        let weekArr: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        
        Utility.shwoActionSheetInViewController(vc: self, withTitle: "Start Week Day", andMessage: "Select start week day!", withButtons: weekArr, cancelAvailable: true) { (intIndex) in
            
            if intIndex < weekArr.count {
                
                print("\(weekArr[intIndex]) button clicked")
                // do your coding stuff here
            }
        }
    }
    
}

extension ViewController: UITextFieldDelegate
{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
}
