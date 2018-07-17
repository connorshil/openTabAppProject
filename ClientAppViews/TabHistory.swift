//
//  ViewController.swift
//  IOS11TouchIDTutorial
//
//  Created by Arthur Knopper on 08/08/2017.
//  Copyright © 2017 Arthur Knopper. All rights reserved.
//

import UIKit
import LocalAuthentication

class TabHistory: UIViewController {
    
    @IBAction func menuClicked(_ sender: UIButton) {
        menuOptions.forEach{(button) in
            UIView.animate(withDuration: 0.3, animations: {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBOutlet var menuOptions: [UIButton]!
    
    enum menuOptionsEnum: String{
        case account = "Account"
        case tabs = "Tabs"
    }
    
    @IBAction func menuSelected(_ sender: UIButton) {
        guard let title = sender.currentTitle, let option = menuOptionsEnum(rawValue: title) else{
            return
        }
        switch option {
        case .account:
            self.performSegue(withIdentifier: "historyToAccount", sender: self)
        case .tabs:
            self.performSegue(withIdentifier: "historyToTabs", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
