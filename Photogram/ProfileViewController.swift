//
//  ProfileViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 8.02.2024.
//

import UIKit
import Firebase
import SafariServices

class ProfileViewController: UIViewController {


    @IBOutlet weak var profileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
    }
    
    @IBAction func logOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
            
        }catch{print("Error")
        }
    }
    
  
    @IBAction func connect(_ sender: Any) {
        
        if let url = URL(string: "https://linktr.ee/fatih.oguz")
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)

         }

    }
    
    @IBAction func otherApp(_ sender: Any) {
        
        if let url = URL(string: "https://github.com/fatihoguuz")
         {

           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)

         }
    }
    
    
    @IBAction func toggleInterfaceStyle(_ sender: Any) {
        let scenes = UIApplication.shared.connectedScenes
                let windowScene = scenes.first as? UIWindowScene
                let window = windowScene?.windows.first
                let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
                
                if interfaceStyle != .dark {
                    window?.overrideUserInterfaceStyle = .dark
                } else {
                    window?.overrideUserInterfaceStyle = .light
                }
            }
    }
    
        
    

