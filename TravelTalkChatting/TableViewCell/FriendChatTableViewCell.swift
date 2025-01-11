//
//  FriendChatTableViewCell.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/11/25.
//

import UIKit

class FriendChatTableViewCell: UITableViewCell {
    
    static let identifier = "FriendChatTableViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendchatTextView: UITextView!
    @IBOutlet var messageDateLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configFriendChat(_ chatlist: Chat, _ tableView: UITableView) {
        
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        
        profileImageView.image = UIImage(named: chatlist.user.rawValue)
        profileImageView.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        profileImageView.clipsToBounds = true
        
        friendNameLabel.text = chatlist.user.rawValue
        friendNameLabel.commonDesign(size: 15, weight: .medium)
        
        messageDateLabel.text = chatlist.date.stringToDateToString2()
        messageDateLabel.commonDesign(color: .systemGray, size: 12, weight: .semibold)
        messageDateLabel.textAlignment = .right
        
        friendchatTextView.text = chatlist.message
        
        friendchatTextView.textColor = .darkText
        friendchatTextView.textAlignment = .left
        friendchatTextView.font = .systemFont(ofSize: 15, weight: .medium)
        friendchatTextView.isScrollEnabled = false
        friendchatTextView.isEditable = false
        friendchatTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        friendchatTextView.layer.borderWidth = 1.5
        friendchatTextView.layer.borderColor = UIColor.systemGray3.cgColor
        friendchatTextView.layer.cornerRadius = 15
        friendchatTextView.backgroundColor = .white
    }
    
}
