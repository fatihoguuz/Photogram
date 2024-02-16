//
//  MainMenuTableViewCell.swift
//  Photogram
//
//  Created by Fatih Oğuz on 15.02.2024.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {
 
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    

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
    }
    
    
    
}
