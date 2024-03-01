//
//  SignUpViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 8.02.2024.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController{

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    

    
   let tableView = UITableView()
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
      /*  if emailText.text == "" && passwordText.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
        */
       /* let isFormValid = emailText.text?.count ?? 0 > 0 && passwordText.text?.count ?? 0 > 0
              if isFormValid {
                  saveButton.isEnabled = true
                  
              } else {
                  saveButton.isEnabled = false
                
              }
    */
    }
            
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is MainMenuViewController{
            let vc = segue.destination as? MainMenuViewController
        }
    }
        
       
    
    @IBAction func saveButton(_ sender: Any) {
        if emailText.text != "" && passwordText.text != ""{
            Auth.auth().createUser(withEmail: emailText.text! , password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "ERROR!", messageInput: error?.localizedDescription ?? "ERROR" )
                }else {
                    self.performSegue(withIdentifier: "toHomeMenu", sender: nil)
                }
                
            }
            
            
        }else{ makeAlert(titleInput: "Error!", messageInput: "Username-Password?")
            
            
        }
    }
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }

   /* @objc func enabled() {
        let isFormValid = emailText.text?.count ?? 0 > 0 && passwordText.text?.count ?? 0 > 0
              if isFormValid {
                  saveButton.isEnabled = true
                  
              } else {
                  saveButton.isEnabled = false
                
              }
    }*/
   
}
