//
//  TravelTalkViewController.swift
//  TravelTalkChatting
//
//  Created by Lee Wonsun on 1/10/25.
//

import UIKit

class TravelTalkViewController: UIViewController {

    @IBOutlet var chatSearchBar: UISearchBar!
    @IBOutlet var chatCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        
        registerCells()
        configCollectionViewLayout()
    }


}

// MARK: - collectionView layout 설정
extension TravelTalkViewController {
    
    func configCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSizeMake(UIScreen.main.bounds.width - 40, 90)
        layout.sectionInset = UIEdgeInsets(top: 4, left: 20, bottom: 4, right: 20)
        layout.minimumLineSpacing = 0
        
        chatCollectionView.collectionViewLayout = layout
    }
}


// MARK: - CollectionView 설정
extension TravelTalkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func registerCells() {
        let xib1 = UINib(nibName: SingleChatCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib1, forCellWithReuseIdentifier: SingleChatCollectionViewCell.identifier)
        
        let xib2 = UINib(nibName: MultiChatCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib2, forCellWithReuseIdentifier: MultiChatCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let list = mockChatList[indexPath.row]  // 주어진 indexPath나 쓰자.. 무슨 부귀영화를 누리겠다고 고차함수 써보겠다며 시간낭비 한 것
        
        if list.chatroomImage.count != 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultiChatCollectionViewCell.identifier, for: indexPath) as? MultiChatCollectionViewCell else { return UICollectionViewCell() }
            
            cell.backgroundColor = .systemBackground
            cell.profileImageViews[0].image = UIImage(named: User.hue.profileImage)
            cell.profileImageViews[1].image = UIImage(named: User.jack.profileImage)
            cell.profileImageViews[2].image = UIImage(named: User.bran.profileImage)
            cell.profileImageViews[3].image = UIImage(named: User.den.profileImage)
            cell.profileImageViews.forEach {
                $0.contentMode = .scaleAspectFit
                $0.clipsToBounds = true
                $0.backgroundColor = .orange
            }
            DispatchQueue.main.async {
                for i in 0...3 {
                    cell.profileImageViews[i].layer.cornerRadius = cell.profileImageViews[i].frame.width / 2
                }
            }
            cell.userNameLabel.text = list.chatroomName
            cell.recentMessageLabel.text = list.chatList.last?.message
            cell.dateLabel.text = list.chatList.last?.date.stringToDateToString()
            
            
            return cell
            
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleChatCollectionViewCell.identifier, for: indexPath) as? SingleChatCollectionViewCell else { return UICollectionViewCell() }
            
            cell.profileImageView.image = UIImage(named: list.chatroomImage[0])
            cell.profileImageView.contentMode = .scaleAspectFill
            DispatchQueue.main.async {
                cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.width / 2
            }
            cell.profileImageView.clipsToBounds = true
            cell.profileImageView.backgroundColor = .systemIndigo
            cell.userNameLabel.text = list.chatroomName
            cell.recentMessageLabel.text = list.chatList.last?.message
            cell.dateLabel.text = list.chatList.last?.date.stringToDateToString()
            
            return cell
        }
    }
}
