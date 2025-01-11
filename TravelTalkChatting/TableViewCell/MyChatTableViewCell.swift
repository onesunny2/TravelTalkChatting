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
    
    func configMyChat(_ chatlist: Chat, _ tableView: UITableView) {
        
        self.selectionStyle = .none
        self.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: tableView.bounds.width)
        
        messageDateLabel.text = chatlist.date.stringToDateToString2()
        messageDateLabel.commonDesign(color: .systemGray, size: 12, weight: .semibold)
        messageDateLabel.textAlignment = .right
        
        mychatTextView.text = chatlist.message
        
        mychatTextView.textColor = .darkText
        mychatTextView.textAlignment = .left
        mychatTextView.font = .systemFont(ofSize: 15, weight: .medium)
        mychatTextView.isScrollEnabled = false
        mychatTextView.isEditable = false
        mychatTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 12, right: 4)
        mychatTextView.layer.borderWidth = 1.5
        mychatTextView.layer.borderColor = UIColor.systemGray3.cgColor
        mychatTextView.layer.cornerRadius = 15
        mychatTextView.backgroundColor = .systemGray6
    }

    
}
