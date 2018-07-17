//
//  ViewController.swift
//  IOS11TouchIDTutorial
//
//  Created by Arthur Knopper on 08/08/2017.
//  Copyright © 2017 Arthur Knopper. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBAction func skip(_ sender: UIButton) {
        self.performSegue(withIdentifier: "authToTabs", sender: self)
    }
    
    @IBAction func authWithTouchID(_ sender: Any) {
        
        let context = LAContext()
        var error: NSError?
        
        
        
        // check if Touch ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            let reason = "Authenticate with Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                {(succes, error) in
                    
                    if succes {
                        self.performSegue(withIdentifier: "authToTabs", sender: self)
                        //need to fix, make faster segue, threading issue
                    }
                    else {
                        self.showAlertController("Touch ID Authentication Failed")
                    }
            })
        }
            
        else {
            showAlertController("Touch ID not available")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showAlertController(_ message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
