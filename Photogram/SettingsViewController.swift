//
//  SettingsViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 9.02.2024.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signOutClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
            
        }catch{print("Error")
        }
    }
}
