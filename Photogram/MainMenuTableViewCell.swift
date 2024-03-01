//
//  MainMenuTableViewCell.swift
//  Photogram
//
//  Created by Fatih Oğuz on 15.02.2024.
//

import UIKit
import Firebase

class MainMenuTableViewCell: UITableViewCell {
 
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var likeLabel: UILabel!
    
    @IBOutlet weak var documentIdLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    @IBAction func likeButton(_ sender: Any) {
        
        let firestoreDataBase = Firestore.firestore()
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes" : likeCount + 1] as [String : Any]
            firestoreDataBase.collection("Posts").document(documentIdLabel.text!).setData(likeStore, merge: true)
        }
    }
    

    @IBAction func commentLabel(_ sender: Any) {
    }
    
    
    
}
