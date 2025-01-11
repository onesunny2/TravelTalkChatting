//
//  ChattingViewController.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/11/25.
//

import UIKit

class ChattingViewController: UIViewController {
    
    static let identifier = "ChattingViewController"

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var bgUIView: UIView!
    @IBOutlet var chatboxImageView: UIImageView!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var chatTextField: UITextField!
    
    var listIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(listIndex)
        print(mockChatList[listIndex].chatList.count)
        
        registerCells()
    }

}

// MARK: - TableView 관련 설정
extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerCells() {
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        
        let xib1 = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        let xib2 = UINib(nibName: FriendChatTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        chatTableView.register(xib2, forCellReuseIdentifier: FriendChatTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList[listIndex].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chatlist = mockChatList[listIndex].chatList[indexPath.row]
        
        if chatlist.user == .user {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as? MyChatTableViewCell else { return UITableViewCell() }
            
            cell.messageDateLabel.text = chatlist.date.stringToDateToString2()
            cell.messageDateLabel.commonDesign(color: .systemGray, size: 12, weight: .semibold)
            cell.messageDateLabel.textAlignment = .right
            cell.mychatTextView.text = chatlist.message
            
            
            return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendChatTableViewCell.identifier, for: indexPath) as? FriendChatTableViewCell else { return UITableViewCell() }
            
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
