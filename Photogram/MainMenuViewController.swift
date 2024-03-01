//
//  MainMenuViewController.swift
//  Photogram
//
//  Created by Fatih Oğuz on 15.02.2024.
//

import UIKit
import Firebase
import SDWebImage

class MainMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //let cellReuseIdentifier = "cell"
    //let cellSpacingHeight: CGFloat = 5
     var userEmailArray = [String]()
    var commentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    //let tool: [String] = ["userEmailArray", "commentArray", "userImageArray"]
   
    
    @IBOutlet weak var tableView: UITableView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
        
        
    }
    //verileri cekmek
    func getDataFromFirestore() {
        let firestoreDataBase = Firestore.firestore()
        //let settings = firestoreDataBase.settings
        firestoreDataBase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot , error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.commentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                       if let postedBy = document.get("postedBy") as? String {
                        self.userEmailArray.append(postedBy)
                        }
                        if let postComment = document.get("postComment") as? String {
                            self.commentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    

   // func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
     //   return cellSpacingHeight
   // }
    
    
   // func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         // let headerView = UIView()
        //  headerView.backgroundColor = UIColor.clear
         // return headerView
     // }
    
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userImageArray.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainMenuTableViewCell
       // cell.textLabel?.text = self.tool[indexPath.section]
        cell.userName.text = userEmailArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        cell.commentLabel.text = commentArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        return cell
    }
    
}
