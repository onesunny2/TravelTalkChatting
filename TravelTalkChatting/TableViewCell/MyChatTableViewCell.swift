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
        
    }

    
}
