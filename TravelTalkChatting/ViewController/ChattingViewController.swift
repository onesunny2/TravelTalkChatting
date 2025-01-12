//
//  ChattingViewController.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/11/25.
//

import UIKit

/*
 < 추가로 시도해본 것 >
 (옵션들 중 추후 코드베이스 학습 후 터득해서 써볼만한 목록들은 이해하지 않고 쓰기보단 차후로 미뤄둠)
 - 내가 쓴 텍스트를 send 버튼 누르면 더미데이터에 추가되어 채팅창이 업데이트 될 수 있도록 시도? => 성공
 */

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
        
        navigationItem.title = mockChatList[listIndex].chatroomName
        
        
        // 🥲🙋🏻‍♀️ 스크롤은 하는데, 뭔가 화면이 전환되는게 보이고 나서 내려가니 부자연 스러운데 방법이 없을지, 지연시키지 않으면 호출 순서로 인해 오류가 발생함
        DispatchQueue.main.async { [self] in
            let indexPath = IndexPath(item: mockChatList[self.listIndex].chatList.count - 1, section: 0)
            chatTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        }
        
        registerCells()
        configUI()
        chatTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // 아래 방법은 좀 반응이 느림
   /* override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let indexPath = IndexPath(item: mockChatList[self.listIndex].chatList.count - 1, section: 0)
        chatTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
    } */

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
        guard let newText = chatTextField.text else { return }
        mockChatList[listIndex].chatList.append(Chat(user: .user, date: Date().DateToString(), message: newText))
        
        chatTableView.reloadData()
        
        
        // reload하고 스크롤 안내려주면 저장된 내용이 안보임
        let indexPath = IndexPath(item: mockChatList[self.listIndex].chatList.count - 1, section: 0)
        chatTableView.scrollToRow(at: indexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        
        chatTextField.text = ""   
    }
    
    @IBAction func didEndOnExitTextfield(_ sender: UITextField) {
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
        
        chatTableView.keyboardDismissMode = .onDrag
        
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
}
