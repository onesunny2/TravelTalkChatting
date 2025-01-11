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
        
        MultiChatCollectionViewCell().backgroundColor = .systemBackground
    }
    
    func configMulticell(_ list: ChatRoom) {
        
        profileImageViews[0].image = UIImage(named: User.hue.profileImage)
        profileImageViews[1].image = UIImage(named: User.jack.profileImage)
        profileImageViews[2].image = UIImage(named: User.bran.profileImage)
        profileImageViews[3].image = UIImage(named: User.den.profileImage)
        profileImageViews.forEach {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.backgroundColor = .orange
        }
        DispatchQueue.main.async {
            for i in 0...3 {
                self.profileImageViews[i].layer.cornerRadius = self.profileImageViews[i].frame.width / 2
            }
        }
        
        userNameLabel.text = list.chatroomName
        userNameLabel.commonDesign()
        recentMessageLabel.text = list.chatList.last?.message
        recentMessageLabel.commonDesign(color: .systemGray, size: 13, weight: .semibold)
        dateLabel.text = list.chatList.last?.date.stringToDateToString()
        dateLabel.commonDesign(color: .systemGray, size: 12, weight: .semibold)
    }

}
