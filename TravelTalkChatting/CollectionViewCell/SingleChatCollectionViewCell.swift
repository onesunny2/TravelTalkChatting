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
        
        SingleChatCollectionViewCell().backgroundColor = .systemBackground
    }
    
    func configSinglecell(_ list: ChatRoom) {
        
        profileImageView.image = UIImage(named: list.chatroomImage[0])
        profileImageView.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .systemIndigo
        userNameLabel.text = list.chatroomName
        userNameLabel.commonDesign()
        recentMessageLabel.text = list.chatList.last?.message
        recentMessageLabel.commonDesign(color: .systemGray, size: 13, weight: .semibold)
        dateLabel.text = list.chatList.last?.date.stringToDateToString()
        dateLabel.commonDesign(color: .systemGray, size: 12, weight: .semibold)
    }
}
