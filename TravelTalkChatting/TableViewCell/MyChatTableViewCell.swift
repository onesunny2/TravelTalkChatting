//
//  MyChatTableViewCell.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/11/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    
    static let identifier = "MyChatTableViewCell"
    
    @IBOutlet var mychatTextView: UITextView!
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
