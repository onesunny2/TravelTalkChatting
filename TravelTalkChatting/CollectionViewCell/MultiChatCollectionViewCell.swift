//
//  MultiChatCollectionViewCell.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/10/25.
//

import UIKit

class MultiChatCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MultiChatCollectionViewCell"

    @IBOutlet var profileImageViews: [UIImageView]!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
