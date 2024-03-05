//
//  UploadViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 8.02.2024.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var shareButton: UIButton!
    let userName = kCFHTTPAuthenticationUsername

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(sharedButtonClicked))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStayle = traitCollection.userInterfaceStyle
        
    
      
    }
    
   
    func makeAlert(titleInput: String , messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func shareButton(_ sender: Any) {
        //storage
        let storage = Storage.storage()
        let storageReference = storage.reference()
        let mediaFolder = storageReference.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data, metadata: nil){ (metadata , error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                }else{
                    imageReference.downloadURL { (URL , error) in
                        if error == nil {
                            let imageUrl = URL?.absoluteString
                            
                
                           let firestoreDataBase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            let firestorePosts = ["imageUrl" : imageUrl! , "postedBy" : Auth.auth().currentUser!.email!  , "postComment" : self.textView.text! , "date" : FieldValue.serverTimestamp() , "likes" : 0] as [String : Any]
                            firestoreReference = firestoreDataBase.collection("Posts").addDocument(data: firestorePosts , completion: { (Error) in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                                }else{
                                    self.imageView.image = UIImage(named: "selectImage.png")
                                    self.textView.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                    
                                }
                            })
                        
                            
                            
                            
                            
                        }
                    }
                }
            }
            
        }
        
        
        
       
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userName"{
            if let destinationVC = segue.destination as? MainMenuViewController {
               
            }
        }
    }
    
    @objc func sharedButtonClicked() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        shareButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStayle = traitCollection.userInterfaceStyle

    }
    
 
}

