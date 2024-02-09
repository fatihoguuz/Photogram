//
//  ProfileViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 8.02.2024.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logoutClicked(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
            
        }catch{print("Error")
            
        }
        
    }
}
