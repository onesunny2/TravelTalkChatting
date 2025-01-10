//
//  SingleChatCollectionViewCell.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/10/25.
//

import UIKit

class SingleChatCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SingleChatCollectionViewCell"

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var recentMessageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
