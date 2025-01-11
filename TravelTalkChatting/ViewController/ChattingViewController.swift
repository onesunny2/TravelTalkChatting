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
        configUI()
    }

}

// MARK: - View 관련
extension ChattingViewController {
    
    func configUI() {
        
        let placeholder = "메세지를 입력하세요 *_*"
        
        bgUIView.backgroundColor = .systemBackground
        
        chatboxImageView.backgroundColor = .systemGray6
        chatboxImageView.layer.cornerRadius = 10
        
        chatTextField.borderStyle = .none
        chatTextField.placeholder = placeholder
        chatTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium)])
        chatTextField.keyboardType = .default
        
        sendButton.setTitle("", for: .normal)
        sendButton.setImage(UIImage(systemName: "paperplane")?.withTintColor(.systemGray3, renderingMode: .alwaysOriginal), for: .normal)
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
            
            cell.configMyChat(chatlist, tableView)
            
            return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendChatTableViewCell.identifier, for: indexPath) as? FriendChatTableViewCell else { return UITableViewCell() }
 
            cell.configFriendChat(chatlist, tableView)
            
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
