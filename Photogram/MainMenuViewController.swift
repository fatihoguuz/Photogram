//
//  MainMenuViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 15.02.2024.
//

import UIKit
import Firebase

class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     var userEmailArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()

   
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
    }
    //verileri cekmek
    func getDataFromFirestore() {
        let firestoreDataBase = Firestore.firestore()
        //let settings = firestoreDataBase.settings
        firestoreDataBase.collection("Posts").addSnapshotListener { (snapshot , error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        
                       if let postedBy = document.get("postedBy") as? String {
                        self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.commentArray.append(postComment)
                        }
                       // if let likes = document.get("likes") as? Int {
                           // self.likeArray.append(likes)
                        //}
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userImageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainMenuTableViewCell
        cell.userName.text = userEmailArray[indexPath.row]
        //cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.userImageView.image = UIImage(named: "F")
        return cell
    }
}
