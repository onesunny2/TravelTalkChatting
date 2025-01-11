//
//  FriendChatTableViewCell.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/11/25.
//

import UIKit

class FriendChatTableViewCell: UITableViewCell {
    
    static let identifier = "FriendChatTableViewCell"
    
    @IBOutlet var profileImageVew: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendchatTextView: UITextView!
    @IBOutlet var messageDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
